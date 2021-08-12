pipeline {
    agent any

    stages {
        stages {
        stage('SCM checkout') {
            steps {
               git 'https://github.com/Kiranug/Simplest-Spring-Boot-Hello-World.git'
          }
        }
        stage('docker build') {
            steps {
                sh """
               //docker build --no-cache -t 595552316002.dkr.ecr.ap-south-1.amazonaws.com/nodejs-image-demo:$BUILD_NUMBER .
               """
            }
        }
        stage('Deploy') {
            steps {
                 sh """
               
                // docker pull 595552316002.dkr.ecr.ap-south-1.amazonaws.com/nodejs-image-demo:$BUILD_NUMBER
                 //docker run -p 8000:8081 -d 595552316002.dkr.ecr.ap-south-1.amazonaws.com/nodejs-image-demo:$BUILD_NUMBE

              """
              


            }
        }
    }
}
