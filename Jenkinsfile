node {
    
    
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
    
      sshagent(['my-ssh-key']) {
   sh ' ssh ubuntu@54.160.132.224 kubectl set image deployments/server.js server.js=alexogdfx/server.js:$BUILD_NUMBER '
}
          stage('Stop and remove container') {
         
        
       sh "docker container stop server.js"
       sh "docker container rm server.js"

    }
    
}
