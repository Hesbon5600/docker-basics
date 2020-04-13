pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building'
        sh '''echo \'+ + + + + Export Vars + + + +\' && \\

export PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin" && \\
export PATH="$PATH:$PYTHON_BIN_PATH"'''
        sh '''echo \' ++++++++++++++++++++++ Install dependancies ++++++++++++++++++++++\' && \\
pip3.7 install pipenv --user && \\
python3.7 pipenv install
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