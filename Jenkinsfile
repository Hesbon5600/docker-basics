pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building'
        echo env.$DB_HOST
      }
    }

    stage('Test') {
      steps {
        echo 'Testing'
        sh '''echo \'\\++++++++++++++++++++++ Install dependancies ++++++++++++++++++++++\\\'
        sh jenkins/test_script.sh '''
      }
    }

    stage('Deploy') {
      steps {
        echo 'Deploying'
      }
    }

  }
}