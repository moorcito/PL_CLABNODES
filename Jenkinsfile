pipeline {
	agent { dockerfile true }
	stages {
		stage('Ansible pre configuration') {
			steps {
				echo "ANSIBLE"
				git 'https://github.com/moorcito/role-base.git'
				sh "pwd && ls -l"

			}
		}
		stage('SETUP: Base configuration') {
			steps {
				ansiblePlaybook credentialsId: 'jaime_default', disableHostKeyChecking: true, extras: 'role=role-base', inventory: 'inventory.yml', limit: "${targets}", playbook: 'pb.yml'
				
			}
		}
		stage('SETUP: Docker daemon') {
			steps {
				ansiblePlaybook credentialsId: 'jaime_default', disableHostKeyChecking: true, extras: 'role=role-docker', inventory: 'inventory.yml', limit: "${targets}", playbook: 'pb.yml'
				
			}
		}
		stage('DEPLOY: Docker containers') {
			steps {
				ansiblePlaybook credentialsId: 'jaime_default', disableHostKeyChecking: true, extras: 'role=role-deploy-containers', inventory: 'inventory.yml', limit: "${targets}", playbook: 'pb.yml'
				
			}
		}
	}
}
