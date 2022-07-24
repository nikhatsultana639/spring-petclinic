pipeline {
    agent { label 'docker' }
    stages {
        stage('Source Code') {
            steps {
                git url: 'https://github.com/nikhatsultana639/spring-petclinic.git', 
                branch: 'main'
            }
        }
        stage('build image using docker file') {
            steps {
                sh 'cd spring-petclinic'
                sh 'docker image build -t spc:1.0 .'
            }
        }
        stage('push image to docker hub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhubsec', variable: 'dockerhubsec')]) {
                sh 'sudo docker login -u nikhatsultana -p ${dockerhubsec}'
                }
                sh 'sudo docker tag spc:1.0 nikhatsultana/spc:1.0'
                sh 'sudo docker push nikhatsultana/spc:1.0'
            }
        } 
        stage('run container') {
            steps {
                sh 'docker container run -d -p 8080:8080 spc:1.0' 
            }
        }
    }
  }
