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
}
