node() {
    def pyrdf_docker
    def worker_docker
    
    stage ("Get repositories") {
        git 'http://localhost:3000/Vetch/RunWIthSecond'
    }
    stage("Build base"){
        docker.build("root_img","--network='host' BaseROOT")
    }
    stage("build images")
        parallel{
            stage("Build command centre"){
                pyrdf_docker = docker.build("pyrdf_terraform","--network='host' commandRING")
            }
            stage("Build worker"){
                worker_docker = docker.build("worker_image","--network='host' WorkerNode")
            }   
        }
    }
 
    stage("Run image"){
        pyrdf_docker.inside{
            sh '. /cern_root/root/bin/thisroot.sh && python2 /cern_root/root/PyRDF/introduction.py'
        }
    }
    stage("Run worker"){
        worker_docker.inside{
            sh '. /cern_root/root/bin/thisroot.sh && python2 /cern_root/root/introduction.py'
        }
    }    
}