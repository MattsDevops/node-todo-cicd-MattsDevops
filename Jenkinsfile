pipeline {
    agent any
    
    stages {
        
        stage("code"){
            steps{
                git url: "https://github.com/MattsDevops/node-todo-cicd-MattsDevops.git", branch: "main"
                echo 'sir,my code is build'
            }
        }
        stage("build and test"){
            steps{
                sh "docker build -t node-app ."
                echo 'sir,my code is built'
            }
        }
        stage("scan image"){
            steps{
                echo 'sir,image is scanned'
            }
        }
        stage("push"){
            steps{
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker tag node-app:latest ${env.dockerHubUser}/node-app:latest"
                sh "docker push ${env.dockerHubUser}/node-app:latest"
                echo 'sir,my code is pushed'
                }
            }
        }
        stage("deploy"){
            steps{
                sh "docker-compose down && docker-compose up -d"
                echo 'sir,my code is deployed'
            }
        }
    }
}
