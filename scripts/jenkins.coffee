# Description:
#  This script interfaces with a jenkins server. It can trigger builds and find build info from jenkins
#
# Dependencies:
#  The targeted jenkins server must have the Build Token Root plugin installed (https://wiki.jenkins-ci.org/display/JENKINS/Build+Token+Root+Plugin )
#  JENKINS_SERVER (ie. jenkins1.ttm.com:8080), JENKINS_JOB, JENKINS_API and JENKINS_TOKEN must be set in your environment variables.
#  The jenkins job that this will trigger must use the parameter "BRANCH_NAME"
#
#  Packages:
#  "jenkinsapi": "git://github.com/jkoenig311/node-jenkins-api.git"
#
# Configuration:
#   None
#
# Commands:
#   hubot build <branch_name> - trigger a build of the branch
#   hubot build failures - get a list of all currently failing builds in jenkins
#   hubot build status - get the current build status for all jenkins jobs
#
# Author:
#   jkoenig311


module.exports = (robot) ->
  robot.respond /build ?(.*)?$/i, (msg) ->
    server = process.env.JENKINS_SERVER
    job = process.env.JENKINS_JOB
    token = process.env.JENKINS_TOKEN
    if server && job && token
      msg.http("http://#{server}/buildByToken/buildWithParameters?job=#{job}&token=#{token}&BRANCH_NAME=#{msg.match[1]}")
      .get() (err, res, body) ->

      msg.send("jenkins is building '#{msg.match[1]}'")
    else
      msg.send("jenkins environment variables not set. JENKINS_SERVER, JENKINS_TOKEN, and JENKINS_JOB")

  robot.respond /build failures/i, (msg) ->
      get_faild_tests(msg)

  robot.respond /build status/i, (msg) ->
      get_status(msg)

  robot.hear /^(Apangea.*.[0-9])+ - #(\d+).+[FAILURE,Unstable]/i, (msg) ->
      get_build_status(msg)

get_build_status = (msg)->
    jenkins = jenkins_init()
    jenkins.build_info msg.match[1], msg.match[2], (err, build_info) ->
        if build_info.result != "SUCCESS"
            msg.send "#{build_info.fullDisplayName}, #{build_info.result}, #{build_info.actions[6].failCount} test failures\ntry looking here for the cause http://#{process.env.JENKINS_SERVER}/#{build_info.actions[1].causes[0].upstreamUrl}#{build_info.actions[1].causes[0].upstreamBuild}"

get_faild_tests = (msg)->
    jenkins = jenkins_init()
    jenkins.all_jobs (err, data) ->
            for job in data
                    jenkins.last_build_info job.name, (err, build_info) ->
                           if build_info.result != "SUCCESS"
                                   if build_info.actions[6] == undefined
                                      msg.send "#{build_info.fullDisplayName}, #{build_info.result}, #{build_info.url}"
                                   else
                                      msg.send "#{build_info.fullDisplayName}, #{build_info.result}, #{build_info.actions[6].failCount} test failures, #{build_info.url}"

get_status = (msg)->
    jenkins = jenkins_init()
    jenkins.all_jobs (err, data) ->
            for job in data
                    jenkins.last_build_info job.name, (err, build_info) ->
                           msg.send "#{build_info.fullDisplayName}, #{build_info.result}"

jenkins_init =  (msg)->
    jenkinsapi = require('jenkins-api')
    api = process.env.JENKINS_API
    user = process.env.JENKINS_USER
    server = process.env.JENKINS_SERVER
    return jenkinsapi.init("http://#{user}:#{api}@#{server}")

