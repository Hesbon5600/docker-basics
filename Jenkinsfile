pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building'
        sh '''echo \'+ + + + Setup the database + + + + + +\'


brew services start postgresql



echo \' ++++++++++++++++++++++ Environment Ready ++++++++++++++++++++++\''''
      }
    }

    stage('Test') {
      steps {
        echo 'Testing'
      }
    }

    stage('Deploy') {
      steps {
        echo 'Deploying'
      }
    }

  }
}