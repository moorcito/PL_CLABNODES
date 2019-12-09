pipeline {
	agent { Dockerfile true }
	stages {
		stage('Ansible pre configuration') {
			steps {
				//TODO: Generate playbook
				//TODO: Generate inventory

			}
		}
		stage('SETUP: Base configuration') {
			steps {
				ansiblePlaybook 
					become: true, 
					credentialsId: 'jaime_default', 
					disableHostKeyChecking: true, 
					extras: 'role=role-base', 
					inventory: 'inventory.yml', 
					limit: "${targets}", 
					playbook: 'pb.yml'
				
			}
		}
		stage('SETUP: Docker daemon') {
			steps {
				ansiblePlaybook 
					become: true, 
					credentialsId: 'jaime_default', 
					disableHostKeyChecking: true, 
					extras: 'role=role-docker', 
					inventory: 'inventory.yml', 
					limit: "${targets}", 
					playbook: 'pb.yml'
				
			}
		}
		stage('DEPLOY: Docker containers') {
			steps {
				ansiblePlaybook 
					become: true, 
					credentialsId: 'jaime_default', 
					disableHostKeyChecking: true, 
					extras: 'role=role-deploy-containers', 
					inventory: 'inventory.yml', 
					limit: "${targets}", 
					playbook: 'pb.yml'
				
			}
		}
	}
}
