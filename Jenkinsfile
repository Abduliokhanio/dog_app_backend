pipeline {
  agent any

  triggers {
    githubPush()
  }

  stages {
    stage('Seeing if connection to GitHub worked') {
      steps {
        echo 'Connected to GitHub!'
      }
    }

    stage('Git Pull') {
      steps {
        dir('/home/ubuntu/dog_app_backend') {
          sh 'git pull git@github.com:Abduliokhanio/dog_app_backend.git master'
        }
        echo 'Finished pulling'
      }
    }

    stage('Rerunning application with its new changes') {
      steps {
        dir('/home/ubuntu/dog_app_backend') {
          echo 'Starting the rerun process for dog_app_backend'
          sh 'docker compose --env-file .env.production up -d'
        }
      }
    }
  }
}
