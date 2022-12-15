node {
    
    sshagent(['my-ssh-key']) {
   sh ' scp /var/lib/jenkins/playbooks.sh ubuntu@ip-172-31-18-127/home/ubuntu/ps '
}
    def image

    stage('Clone repository') {
       

        checkout scm
    }

    stage('Build image') {


        image = docker.build('alexogdfx/server.js')
      
    }

       stage('run and Test image') {
   

           sh 'docker container run --detach --publish 80:80 --name server.js alexogdfx/server.js:1.0'
           sh 'docker container ls'
           }
           
   

    stage('Push image') {
       
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            image.push("${env.BUILD_NUMBER}")
            image.push("latest")
        }
    }
          stage('Stop and remove container') {
         
        
       sh "docker container stop server.js"
       sh "docker container rm server.js"

    }
    
}
