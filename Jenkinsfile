pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building'
        sh '''echo \' ++++++++++++++++++++++ Install dependancies ++++++++++++++++++++++\' && \\
pip3 install pipenv && \\
pipenv install
'''
        sh '''echo \'+ + + + Setup the database + + + + + +\' &&
service postgresql start && \\
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