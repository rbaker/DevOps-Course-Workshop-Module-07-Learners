pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                dotnetRestore
                dotnetBuild
            }
        }
        stage('Test') {
            steps {
                dotnetTest
            }
      }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}