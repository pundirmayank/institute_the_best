pipeline {
    agent any
    environment {
        FLUTTER_HOME = "D:\\Mayank\\flutter_plugin\\flutter_3.29.2\\flutter\\bin"
        ANDROID_HOME = "C:\\Users\\Mayank Pundir\\AppData\\Local\\Android\\Sdk"
        JAVA_HOME = "C:\\Program Files\\Java\\jdk-17\\"
    }
    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'master', url: 'https://github.com/pundirmayank/institute_the_best.git'
            }
        }

        stage('Flutter Build App Bundle') {
            steps {
                bat "${FLUTTER_HOME}flutter build appbundle"
            }
        }
    }
}
