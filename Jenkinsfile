pipeline {
    agent { label 'built-in' }
    triggers { pollSCM('* * * * *') }
    stages {
        stage('SourceCode') {
            steps {
                git branch: 'main', url: 'https://github.com/nikhatsultana639/spring-petclinic.git'
            }
        }
        stage('Build the Code and sonarqube-analysis') {
            steps {
                withSonarQubeEnv('sonarQube') {
                    sh script: "mvn package sonar:sonar"
                }

            }
        }
        stage('reporting') {
            steps {
                junit testResults: '**/surefire-reports/*.xml'
            }
        }
    }
}
