pipeline {
  agent {
    node {
      label 'slave'
    }

  }
  stages {
    stage('build') {
      agent {
        node {
          label 'maven'
        }

      }
      steps {
        sh 'mvn clean compile package'
      }
    }

  }
}