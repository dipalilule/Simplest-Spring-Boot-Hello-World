pipeline {
    agent any
    stages {
        stage('SCM checkout') {
            steps {
               git 'https://github.com/Kiranug/Simplest-Spring-Boot-Hello-World.git'
          }
        }
         stage('Build') {
            steps {
                echo 'Building..'
                sh 'mvn clean package'
            }
             post {
                 success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                 }
             }
        }
        
          stage('Docker Build') {
            steps {
                echo 'Docker image Building..'
                sh """
                docker build -t helloapp .
                docker tag 
                docker tag helloapp gcr.io/neural-mantra-303016/helloapp:v1
                docker push gcr.io/neural-mantra-303016/helloapp:v1      
                """
                
            }
        }
        
        /* stage('DeployToStaging') {
            when {
                branch 'master'
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'webserver_login', usernameVariable: 'USERNAME', passwordVariable: 'USERPASS')]) {
                    sshPublisher(
                        failOnError: true,
                        continueOnError: false,
                        publishers: [
                            sshPublisherDesc(
                                configName: 'Staging',
                                sshCredentials: [
                                    username: "$USERNAME",
                                    encryptedPassphrase: "$USERPASS"
                                ], 
                                transfers: [
                                    sshTransfer(
                                        sourceFiles: '/var/lib/jenkins/workspace/maven-git_pipeline/webapp/target/webapp.war',
                                        removePrefix: '/var/lib/jenkins/workspace/maven-git_pipeline/webapp/target/',
                                        remoteDirectory: '/usr/share/tomcat/webapps/',
                                        execCommand: 'sudo systemctl restart tomcat'
                                    )
                                ]
                            )
                        ]
                    )
                }
            }
        } */
    }
}
