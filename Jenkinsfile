pipepline {
    agent any 
        environment {
            aws_region = 'eu-west-1'
            ecr_repo_name = 'nodeapprepo'
            ecr_registry = ''
            image = image:v1
        }
    
    stages {
        stage ('Git checkout') {
            steps {
                git : 'https://github.com/Ullas-h/hackathonHCL.git' , branch :'main'
            }
        }
    
    stage ('Docker build') {
        steps {
            scripts {
                sh (docker build -t $ecr_repo_name-myapp .)
                sh (docker tag $ecr_repo_name-myapp:v1)
            }
        }
    }

    stage ('aws ecr login') {
        steps {
            scripts {
                sh (aws ecr login account_id -u username -p | docker login account_id -u username -p)
                sh (docker push $ecr_repo_name-myapp:v1)
            }
        }
    }

    stage ('aws ecr login') {
        steps {
            scripts {
                sh aws ecr login account_id -u username -p
            }
        }
    }

    }
}