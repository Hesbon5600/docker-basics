pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building'
        sh '''echo \'\\++++++++++++++++++++++ Install dependancies ++++++++++++++++++++++\\\'
export PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
export PATH="$PATH:$PYTHON_BIN_PATH"
pip3 install pipenv 
pipenv install'''
      }
    }

    stage('Test') {
      steps {
        echo 'Testing'
        sh 'pipenv --version'
      }
    }

    stage('Deploy') {
      steps {
        echo 'Deploying'
      }
    }

  }
}