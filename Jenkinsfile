node {
    def image

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }
  
    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        sh "docker image build --tag alexogdfx/serverjs:1.0 ."
        sh "docker container run --detach --publish 80:80 --name server.js alexogdfx/server.js:1.0"
    }
    stage('Test Image') {
       sh "bash launch-test.sh"
    }
}

