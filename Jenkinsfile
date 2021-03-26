pipeline {

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/sagar-kale/kube_cicd_demo.git', branch:'master'
      }
    }
    
      stage("Build image") {
            steps {
                script {
                    myapp =  docker.build("sgrkale/kube_cicd_demo:${env.BUILD_ID}")
                }
            }
        }
    
      stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

    
    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "hellowhale.yml", kubeconfigId: "d5cae5ee-16a4-4020-a02e-9aa883981210")
        }
      }
    }

  }
}
