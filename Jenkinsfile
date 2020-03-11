pipeline {
    agent none

    stages{
        
        stage ("Get repositories") {
            steps{
                script{
            def pyrdf_docker
            def worker_docker
            git 'http://localhost:3000/Vetch/RunWIthSecond'
                }
            }
        }
        stage("Build base"){
            steps{
            script{
            docker.build("root_img","--network='host' BaseROOT")
            }
            }
        }
        stage("build images"){
            parallel{
                steps{
                stage("Build command centre"){
                    script{
                    pyrdf_docker = docker.build("pyrdf_terraform","--network='host' commandRING")
                    }
                }
                stage("Build worker"){
                    script{
                    worker_docker = docker.build("worker_image","--network='host' WorkerNode")
                    }
                }   
                }
            }
            
        }
        stage("Run image"){
            steps{
            script{
            pyrdf_docker.inside{
                sh '. /cern_root/root/bin/thisroot.sh && python2 /cern_root/root/PyRDF/introduction.py'
            }
            }
            }
        }
        stage("Run worker"){
            steps{
            script{
            worker_docker.inside{
                sh '. /cern_root/root/bin/thisroot.sh && python2 /cern_root/root/introduction.py'
            }
            }
            }
        }
    }
}