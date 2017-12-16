#!groovy

properties([
        [
            $class: 'GithubProjectProperty',
            displayName: 'Document Management Performance Tests',
            projectUrlStr: 'https://github.com/hmcts/document-management-performance-tests/'
        ],
         pipelineTriggers([
                 [$class: 'GitHubPushTrigger']
         ])
])

@Library('Reform') _

String channel = '#dm-pipeline'

def branchName = ('master' == "${env.BRANCH_NAME}") ? "${env.BRANCH_NAME}" : "${env.CHANGE_BRANCH}"

node {
    try{

        stage('Checkout') {
            deleteDir()
            echo sh(returnStdout: true, script: 'env')
            checkout scm
        }

        stage('Build') {
            sh './gradlew clean gatlingClasses'
        }

        if ('master' == "${env.BRANCH_NAME}") {
            stage('Publish Docker') {
                dockerImage([imageName: 'evidence/performance-tests'])
            }
        }

    } catch (e){
        notifyBuildFailure channel: channel
        throw e
    }
    notifyBuildFixed channel: channel
}
