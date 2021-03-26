# kube_cicd_demo
## give access jenkins to following path using adding jenkins to its accessible group
```` kubectl view config ````
```` sudo chown -R jenkins:jenkins /home/sagar/.minikube/ ````

#### create service aaccount as jenkins
```` kubectl create serviceaccount jenkins ````

Check using below command

```` kubectl get secret````

Copy secrete using 

```` kubectl describe secret <secretename> ````

It will give you secrete text-> go jenkins credentials->crete credential type as secrete text
add copied text in secrete textbox give id as myscrete

#### Start kubectl proxy server to access api using withCredential via Jenkinsfile

```` kubectl proxy --port=7777 & ````

go to jenkins select project demo1 ->pipeline syntax ->snippet Generator-> withKubeCredential and all kubernetes api endpoint as

```` http://localhost:7777 ```` then select credential mysecrete leave rest fields blank and click generate snippet then copy and paste it in Jenkinsfile Deploy section

```` withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: '', contextName: '', credentialsId: 'mysecrete', namespace: '', serverUrl: 'http://localhost:7777']]) 
          {
            sh 'kubectl create -f $WORKSPACE/hellowhale.yml' // this added manually
          }
````

#### Note - In order to use withKubeCredential install jenkins plugin ( Kubernetes CLI )


