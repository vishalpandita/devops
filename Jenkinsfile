pipeline {
  agent any
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