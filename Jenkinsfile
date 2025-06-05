pipeline {
    agent any
    environment {
      PATH = "D:\\Mayank\\flutter_plugin\\flutter_3.29.2\\flutter\\bin\\"
    }    
    stages {
        stage('Setup') {
            steps {
                print "${env.PATH}"
            }    
        }
        
        stage('Build') {
            steps {
                bet "flutter doctor -v"
            }
        }        
    }
}

