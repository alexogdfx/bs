node {
    
    sshagent(['my-ssh-key']) {
   sh ' ssh ubuntu@54.91.219.125 kubectl set image deployments/server.js server.js=alexogdfx/server.js$BUILD_NUMBER'
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
