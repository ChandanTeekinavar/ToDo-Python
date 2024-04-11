node{
    
    stage('code checkout'){
        git branch: 'main', url: 'https://github.com/ChandanTeekinavar/ToDo-Python.git'
    }
    
    stage ('containerize'){
        sh 'docker build -t chandanteekinavar/todo-app_python:1.0 .'
    }
    
     stage('push to dockerhub'){
         
         withCredentials([string(credentialsId: 'dockerPwd', variable: 'dockerHubPwd')]) {
         sh "docker login -u chandanteekinavar -p ${dockerHubPwd}"
         sh 'docker push chandanteekinavar/todo-app_python:1.0'
         }
         
     }
     
     stage('Deploy'){
         ansiblePlaybook become: true, credentialsId: 'ansible-ssh-jenkins-key', disableHostKeyChecking: true, installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: 'playbook.yml', vaultTmpPath: ''
     }
    
    
    
}