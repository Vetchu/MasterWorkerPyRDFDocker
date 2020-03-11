FROM root_img:latest

#DOWNLOAD PYRDF AND DEPENDENCIES
RUN yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN yum install -y postgresql12
RUN curl https://raw.githubusercontent.com/JavierCVilla/PyRDF/master/tutorials/local/sequential/df001_introduction.py > ${roothome}/introduction.py

CMD . ${roothome}/bin/thisroot.sh && root