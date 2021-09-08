node {
    try {
        notifyBuild('STARTED')

        environment {
            DOTNET_CLI_HOME = '/tmp/dotnet_cli_home'
        }

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
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
  } catch (e) {
        // If there was an exception thrown, the build failed
        currentBuild.result = 'FAILED'
        throw e
  } finally {
        // Success or failure, always send notifications
        notifyBuild(currentBuild.result)
    }
}

def notifyBuild(String buildStatus = 'STARTED') {
    // build status of null means successful
    buildStatus =  buildStatus ?: 'SUCCESSFUL'

    // Default values
    String colorCode = '#FF0000'
    String subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
    String summary = "${subject} (${env.BUILD_URL})"

    // Override default values based on build status
    if (buildStatus == 'STARTED') {
        color = 'YELLOW'
        colorCode = '#FFFF00'
  } else if (buildStatus == 'SUCCESSFUL') {
        color = 'GREEN'
        colorCode = '#00FF00'
  } else {
        color = 'RED'
        colorCode = '#FF0000'
    }

    // Send notifications
    slackSend (color: colorCode, message: summary)
}
