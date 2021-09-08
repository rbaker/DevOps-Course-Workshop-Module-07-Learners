pipeline {
    agent {
        docker { image "mcr.microsoft.com/dotnet/sdk:5.0" }
    }

    stages {
        stage('Build') {
            steps {
                dotnet restore
                dotnet build --configuration Release --no-restore
            }
        }
        stage('Test') {
            steps {
                dotnet test --no-restore --verbosity normal
            }
      }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}