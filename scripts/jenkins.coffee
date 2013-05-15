# Description:
#  This script interfaces with a jenkins server.  As of right now it is only being used to trigger jobs based of the Build Token Root plugin
#
# Dependencies:
#  The targeted jenkins server must have the Build Token Root plugin installed (https://wiki.jenkins-ci.org/display/JENKINS/Build+Token+Root+Plugin )
#  JENKINS_URL, JENKINS_JOB, and JENKINS_TOKEN must be set in your environment variables.
#  The jenkins job that this will trigger must use the parameter "BRANCH_NAME"
#
# Configuration:
#   None
#
# Commands:
#   hubot build <branch_name> - trigger a build of the branch
#
# Author:
#   jkoenig311

module.exports = (robot) ->
  robot.respond /build ?(.*)?$/i, (msg) ->
    url = process.env.JENKINS_URL
    job = process.env.JENKINS_JOB
    token = process.env.JENKINS_TOKEN
    msg.http("#{url}/buildByToken/buildWithParameters?job=#{job}&token=#{token}&BRANCH_NAME=#{msg.match[1]}")
    .get() (err, res, body) ->

    msg.send("jenkins is building '#{msg.match[1]}'")
