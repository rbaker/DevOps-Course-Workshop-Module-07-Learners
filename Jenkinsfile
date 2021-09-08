pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'dotnet restore'
                sh 'dotnet build --configuration Release --no-restore'
            }
        }
        stage('Test') {
            steps {
                sh 'dotnet test --no-restore --verbosity normal'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}