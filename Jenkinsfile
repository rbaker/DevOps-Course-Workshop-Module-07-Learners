pipeline {

    stages {
        agent {
            docker { image 'mcr.microsoft.com/dotnet/sdk:5.0' }
        }

        environment {
            DOTNET_CLI_HOME = '/tmp/dotnet_cli_home'
        }

        stage('Build') {
            steps {
                sh 'dotnet restore'
                sh 'dotnet build --configuration Release --no-restore'
            }
        }
        stage('Test') {
            agent {
                docker { image 'mcr.microsoft.com/dotnet/sdk:5.0' }
            }

            environment {
                DOTNET_CLI_HOME = '/tmp/dotnet_cli_home'
            }
            steps {
                sh 'dotnet test --no-restore --verbosity normal'
            }
        }
        stage('NPM Installation') {
            agent {
                docker {
                    image 'node:alpine'
                }
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
