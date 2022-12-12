node {
    def image

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }
  
    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        
      

        sh "docker image build --tag alexogdfx/server.js:1.0 ."
        sh "docker container run --detach --publish 80:80 --name server.js alexogdfx/server.js:1.0"
    }
    
       stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
       }
   
    stage('Test Image') {
       sh "bash launch-test.sh"
    }
    
      stage('Stop and remove container') {
         
        
       sh "docker container stop server.js"
       sh "docker container rm server.js"

    }
    
     
}

