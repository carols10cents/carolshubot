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
#   jenkins failures <filter> - get a list of all currently failing builds in jenkins
#   jenkins status - get the current build status for all jenkins jobs
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

  robot.hear /^jenkins failures( \w+||())/i, (msg) ->
      get_faild_tests(msg)

  robot.hear /jenkins status/i, (msg) ->
      get_status(msg)

  robot.hear /^(Apangea.*.[0-9])+ - #(\d+).+[FAILURE,Unstable]/i, (msg) ->
      get_build_status(msg)

get_build_status = (msg)->
    jenkins = jenkins_init()
    jenkins.build_info msg.match[1], msg.match[2], (err, info) ->
            causes = info.actions[1].causes[0]
            jenkins.build_info causes.upstreamProject, causes.upstreamBuild, (err, parent_info) ->
              message = "#{info.fullDisplayName}, #{info.result}, #{info.actions[6].failCount} test failures.
              \nParent job of failure: http://#{process.env.JENKINS_SERVER}/#{causes.upstreamUrl}#{causes.upstreamBuild}"
              if parent_info.actions[0].parameters != undefined
                      message += "\nBranch name: #{parent_info.actions[0].parameters[0].value}"
              if parent_info.culprits != undefined && parent_info.culprits[0] != undefined
                      message += "\nPossible Culprits: #{parent_info.culprits[0].fullName}"
              msg.send message

get_faild_tests = (msg)->
    jenkins = jenkins_init()
    filter = msg.match[1].replace(" ","")
    filter_regex = new RegExp(filter, "i")
    jenkins.all_jobs (err, data) ->
            for job in data
                    jenkins.last_completed_build_info job.name, (err, info) ->
                           if info.result? && info.result != "SUCCESS"
                                   if info.actions == undefined || info.actions[6] == undefined
                                      message ="#{info.fullDisplayName}, #{info.result}, #{info.url}"
                                   else
                                      message ="#{info.fullDisplayName}, #{info.result}, #{info.actions[6].failCount} test failures, #{info.url}"
                                   msg.send(message) unless !filter.undefined? and !info.fullDisplayName.match(filter_regex)? # if a filter was provided, only show matches

get_status = (msg)->
    jenkins = jenkins_init()
    jenkins.all_jobs (err, data) ->
            for job in data
                    jenkins.last_completed_build_info job.name, (err, info) ->
                           msg.send "#{info.fullDisplayName}, #{info.result}"

jenkins_init =  (msg)->
    jenkinsapi = require('jenkins-api')
    api = process.env.JENKINS_API
    user = process.env.JENKINS_USER
    server = process.env.JENKINS_SERVER
    return jenkinsapi.init("http://#{user}:#{api}@#{server}")

