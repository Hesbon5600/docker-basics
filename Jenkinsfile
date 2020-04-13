pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building'
        sh '''echo \' ++++++++++++++++++++++ Install dependancies ++++++++++++++++++++++\' && \\
python3.6 -m pipenv install
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