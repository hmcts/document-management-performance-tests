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

node {
    try{

        stage('Checkout') {
            deleteDir()
            sh "echo ${env.BRANCH}"
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
