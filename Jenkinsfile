node {
    def image

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }
  
    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        image = docker.build("bs/dockerfile")
    }
    stage('Test Image') {
        ./launch-test.sh
    }
}

