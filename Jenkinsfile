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
export PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
export PATH="$PATH:$PYTHON_BIN_PATH"
pip3 install pipenv
pipenv install

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