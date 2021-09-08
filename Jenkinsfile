pipeline {
    agent any

    environment {
                DOTNET_CLI_HOME = '/tmp/dotnet_cli_home'
    }

    stages {
        stage('Build') {
            agent {
                docker { image 'mcr.microsoft.com/dotnet/sdk:5.0' }
            }
            steps {
                sh 'dotnet restore'
                sh 'dotnet build --configuration Release --no-restore'
            }
        }
        stage('Test') {
            agent {
                docker { image 'mcr.microsoft.com/dotnet/sdk:5.0' }
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
                dir ('DotnetTemplate.Web') {
                    sh 'npm install'
                    sh 'npm t'
                    sh 'npm run lint'
                }
            }
            slackSend channel: 'workshop-7-alerts-rich-sushma', color: 'good', failOnError: true, message: 'Build Complete', tokenCredentialId: 'workshop-7-notifier'
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }

}
