FROM root_img:latest

#DOWNLOAD PYRDF AND DEPENDENCIES
RUN yum install -y postgres
RUN curl https://raw.githubusercontent.com/JavierCVilla/PyRDF/master/tutorials/local/sequential/df001_introduction.py > ${roothome}/introduction.py

CMD . ${roothome}/bin/thisroot.sh && python2 ${roothome}/PyRDF/introduction.py