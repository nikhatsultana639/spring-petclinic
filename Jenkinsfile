pipeline {
    agent { label 'built-in' }
    options { 
        timeout(time: 1, unit: 'HOURS')
    }
    triggers {
        cron('0 * * * *')
    }
    stages {
        stage('Source Code') {
            steps {
                git url: 'https://github.com/nikhatsultana639/spring-petclinic.git', 
                branch: 'main'
            }

        }
        stage('Artifactory-Configuration') {
            steps {
                rtMavenDeployer (
                    id: 'spc-deployer',
                    serverId: 'jfrogArtifact',
                    releaseRepo: 'libs-release-local',
                    snapshotRepo: 'libs-snapshot-local',

                )
            }
        }
        stage('Build the Code and sonarqube-analysis') {
            steps {

                rtMavenRun (
                    // Tool name from Jenkins configuration.
                    tool: 'MVN_DEFAULT',
                    pom: 'pom.xml',
                    goals: 'clean install',
                    // Maven options.
                    deployerId: 'spc-deployer',
                )

            }
        }
        stage('reporting') {
            steps {
                junit testResults: 'target/surefire-reports/*.xml'
            }
        }


    }

}
