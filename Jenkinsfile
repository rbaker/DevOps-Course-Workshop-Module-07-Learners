pipeline {
    agent any

    stages {
        stage('Build') {
            sh label:
                'install dependencies'
            script: '''
                dotnet restore
                dotnet build --configuration Release --no-restore
            '''
        }
        stage('Test') {
        sh label:
          'Running npm run test',
        script: '''
          node --version
          cd hello-world-node
          npm run test
        '''
      }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}