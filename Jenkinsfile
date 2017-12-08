#!groovy

properties([
        [$class: 'GithubProjectProperty', projectUrlStr: 'https://github.com/hmcts/document-management-performance-tests/'],
         pipelineTriggers([
                 [$class: 'GitHubPushTrigger']
         ])
])

@Library('Reform') _

node {
    try{

        stage('Checkout') {
            deleteDir()
            checkout scm
        }

        stage('Build') {
            sh 'mvn scala:testCompile'
        }

        if ('master' == "${env.BRANCH_NAME}") {
            stage('Publish Docker') {
                dockerImage([imageName: 'evidence/performance-tests'])
            }
        }

    } catch (err){
        slackSend(
                channel: "#em-dev",
                color: 'danger',
                message: "${env.JOB_NAME}:  <${env.BUILD_URL}console|Build ${env.BUILD_DISPLAY_NAME}> has FAILED")
        throw err
    }
}
