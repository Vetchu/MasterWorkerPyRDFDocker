node() {
    def pyrdf_docker
    stage ("Get image") {
        git 'http://localhost:3000/Vetch/DockerStage2Test'
    }
    stage("Build base"){
        docker.build("root_img","--network='host' BaseROOT")
    }
    stage("Build pyrdf"){
        pyrdf_docker = docker.build("pyrdf_terraform","--network='host' commandRING")
    }
    stage("Run image"){
        pyrdf_docker.inside{
            sh '. /cern_root/root/bin/thisroot.sh && python2 /cern_root/root/PyRDF/introduction.py'
        }
    }
}