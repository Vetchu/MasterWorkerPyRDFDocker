FROM centos:7
RUN curl -L https://root.cern/download/root_v6.18.04.Linux-centos7-x86_64-gcc4.8.tar.gz -o rootbin.tar.gz
ENV roothome=/cern_root/root

RUN mkdir /cern_root && tar -xvf rootbin.tar.gz -C /cern_root
RUN yum install -y git python2 libXft cmake gcc-c++ gcc binutils \
    libX11-devel libXpm-devel libXft-devel libXext-devel \
    gcc-gfortran openssl-devel pcre-devel \
    mesa-libGL-devel mesa-libGLU-devel glew-devel ftgl-devel mysql-devel \
    fftw-devel cfitsio-devel graphviz-devel \
    avahi-compat-libdns_sd-devel libldap-dev python-devel \
    libxml2-devel gsl-static

RUN for dir in tutorials README cmake js icons; do \
        rm -rf ${roothome}/$dir; \
    done 
    

CMD . ${roothome}/bin/thisroot.sh && root