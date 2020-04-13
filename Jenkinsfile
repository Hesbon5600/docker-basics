pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building'
        sh '''echo \' ++++++++++++++++++++++ Install dependancies ++++++++++++++++++++++\'
export PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
export PATH="$PATH:$PYTHON_BIN_PATH"
pip3 install pipenv 
pipenv install
'''
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