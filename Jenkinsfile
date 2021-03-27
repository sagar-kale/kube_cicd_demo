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
          // kubernetesDeploy(configs: "hellowhale.yml", kubeconfigId: "mukubeconfig")
       /*   withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: '', contextName: '', credentialsId: 'mysecrete', namespace: '', serverUrl: 'http://localhost:7777']]) 
          {
            sh 'kubectl create -f $WORKSPACE/hellowhale.yml'
          } */
          kubeconfig(credentialsId: 'mysecret', serverUrl: 'http://localhost:7777') {
            sh 'kubectl create -f $WORKSPACE/hellowhale.yml'
            sh 'kubectl get pods'
          }
        }
      }
    }

  }
}
