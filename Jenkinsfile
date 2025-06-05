pipeline {
    agent any
    //environment {
     //   FLUTTER_HOME = "D:\\Mayank\\flutter_plugin\\flutter_3.29.2\\flutter\\bin\\"
     //   ANDROID_HOME = "C:\\Users\\Mayank Pundir\\AppData\\Local\\Android\\Sdk"
    //    JAVA_HOME = "C:\\Program Files\\Java\\jdk-17\\"
   // }
    stages {
        stage('Clone Repo') {
            steps {
               // git branch: 'master', url: 'https://github.com/pundirmayank/institute_the_best.git'
                echo 'Checking out source code...'
                checkout scm // Checks out the repository this Jenkinsfile is in

            }
        }
        
    stage('Setup Flutter') {
            steps {
                sh 'flutter --version'
                sh 'flutter doctor -v' // Good for debugging environment issues
                // sh '''
                //  #!/bin/sh
                //  flutter build apk --debug
                //  '''
            }
        }

      //  stage('Get Dependencies') {
      //      steps {
      //          echo 'Fetching Flutter dependencies...'
      //          sh 'flutter pub get'
      //      }
      //  }
        
      //  stage('Flutter Build App Bundle') {
      //      steps {
       //         bat "flutter build appbundle"
       //     }
       // }
    }
}
