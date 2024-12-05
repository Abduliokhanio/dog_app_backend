pipeline {
  agent any

  triggers {
    githubPush()
  }

  environment {
    APP_NAME = 'dog_app_backend'
    APP_DIR = '/home/ubuntu/dog_app_backend'
  }

  stages {
    stage('Seeing if connection to GitHub worked') {
      steps {
        echo 'Connected to GitHub baby'
      }
    }
    stage('Git Pull') {
      steps {
        sh '''
          cd ${APP_DIR}
          git reset --hard HEAD
          echo "Currently in this branch: $(pwd)"
          git pull git@github.com:Abduliokhanio/dog_app_backend.git master
          echo "Finished pulling"
        '''
      }
    }
    stage('Rerunning application with its new changes') {
      steps {
        sh '''
          cd ${APP_DIR}
          echo "Starting the rerun process for ${APP_NAME}"
          echo "Currently in this branch: $(pwd)"
          echo "Running ls -a to see what all the files are:"
          ls -a
          docker compose --env-file .env.production up -d
        '''
      }
    }
  }
}
