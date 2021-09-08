pipeline {
    agent {
        docker { image 'mcr.microsoft.com/dotnet/sdk:5.0' }
    }

    environment {
        DOTNET_CLI_HOME = '/tmp/dotnet_cli_home'
    }

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
        stage('NPM Installation') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                sh 'npm install'
                sh 'npm t'
                sh 'npm run lint'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
