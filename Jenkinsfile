pipeline {
  agent {
    docker {
	  image 'vishalpandita/maven:3.8.1-adoptopenjdk-11-docker'
	  args '-v /home/docker/.gitconfig:/root/.gitconfig -v /home/docker/.git-credentials:/root/.git-credentials -v /home/docker/.docker/config.json:/root/.docker/config.json -v /home/docker/.m2:/root/.m2 --network jenkins  -e HTTP_PROXY="http://209.58.84.119:3128" -e HTTPS_PROXY="http://209.58.84.119:3128" --dns="8.8.8.8" --env NO_PROXY="docker"  --env DOCKER_HOST=tcp://docker:2376   --env DOCKER_CERT_PATH=/certs/client   --env DOCKER_TLS_VERIFY=1  --volume jenkins-docker-certs:/certs/client:ro'
	}
  }


  stages {
	stage ('feature-branch-action') {
	    when {
		  not {
			anyOf {
				branch comparator: 'GLOB', pattern: 'main'
				branch comparator: 'GLOB', pattern: 'develop'
				}
			}
		}
	  steps{
	    sh 'mvn clean compile package'
	  }
	}


	
	stage ('main-branch-action') {
	    when {
			anyOf {
				branch comparator: 'GLOB', pattern: 'main'
				branch comparator: 'GLOB', pattern: 'develop'
				}
		}
	  steps {
	    sh 'mvn clean package'
		echo "creating docker image"
		sh 'mv target/*war target/devops.war'
		sh 'docker build -t vishalpandita/application .'
		echo "pushing image to container repository"
		sh 'docker push vishalpandita/application'
		sshPublisher(publishers: [sshPublisherDesc(configName: 'server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: './dev.sh', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
		

	  }
	}	
  }  

post { 
        always { 
            cleanWs()
        }
    }
}
