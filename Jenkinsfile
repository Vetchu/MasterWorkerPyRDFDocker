node() {
        stage ("Get repositories") {
                script{
            def pyrdf_docker
            def worker_docker
            git 'http://localhost:3000/Vetch/RunWIthSecond'
                }
            
        }
        stage("Build base"){
            script{
            docker.build("root_img","--network='host' BaseROOT")
            }
            
        }
        
        stage("build images"){
            parallel(
                "command":{
                    stage("Build command centre"){
                        script{
                            pyrdf_docker = docker.build("pyrdf_terraform","--network='host' commandRING")
                        }
                    }
                    stage("Run image"){

                        pyrdf_docker.inside("--network='host' -v /etc/passwd:/etc/passwd:ro")
                        {
                            // sh '. /cern_root/root/bin/thisroot.sh && python2 /cern_root/root/PyRDF/introduction.py'
                            sh 'cd /terraform && terraform init &&  terraform apply -auto-approve'
                        }
                    }                
                
                },
                "worker":{
                    stage("Build worker"){
                        script{
                            worker_docker = docker.build("worker_image","--network='host' WorkerNode")
                        }
                    }
                    stage("Run worker"){
                        worker_docker.inside{
                            sh '. /cern_root/root/bin/thisroot.sh && psql --version'
                        }
                    }
                }   
            )
            
        }


    
}