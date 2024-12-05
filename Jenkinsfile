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
    stage('seeing if connection to github worked') {
      steps {
        echo 'conneted to github baby'
      }
    }
    stage('Git Pull') {
      steps {
        sh "cd ${APP_DIR}"
        echo "currently in this branch: ${APP_DIR}"
        sh 'git pull git@github.com:Abduliokhanio/dog_app_backend.git master'
        echo "finished pulling"
      }
    }
    stage('reruning application with its new changes') {
      steps {
        echo "starting the rerun process for ${APP_NAME}"
        sh "cd ${APP_DIR}"
        echo "Currently in this branch: $(pwd)"
        echo "running ls -a to see what all the files are:"
        sh "ls -a"
        sh "docker compose --env-file .env.production up -d"
      }
    }
  }
}