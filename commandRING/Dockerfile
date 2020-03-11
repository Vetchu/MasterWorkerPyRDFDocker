FROM root_img:latest

#DOWNLOAD PYRDF AND DEPENDENCIES
RUN yum install -y epel-release && yum install -y python-pip pandoc

RUN git clone https://github.com/JavierCVilla/PyRDF ${roothome}/PyRDF
RUN pip install --upgrade pip && \
    pip install wheel && \
    pip install -r ${roothome}/PyRDF/requirements.txt && \
    pip install pyspark --no-cache-dir
    
RUN curl https://raw.githubusercontent.com/JavierCVilla/PyRDF/master/tutorials/local/sequential/df001_introduction.py > ${roothome}/PyRDF/introduction.py

#INSTALL TERRAFORM
RUN curl -L https://releases.hashicorp.com/terraform/0.12.23/terraform_0.12.23_linux_amd64.zip >terraform.zip
RUN yum install -y unzip && unzip terraform.zip -d /usr/bin/
RUN chmod +x /usr/bin/terraform
ADD "main.tf" /terraform
COPY "/home/vetch/.ssh/id_rsa.pub" /terraform
RUN export TF_VAR_pub_key="$(cat /terraform/id_rsa.pub)"

RUN cd /terraform
RUN terraform init
RUN terraform apply -auto-approve

CMD . ${roothome}/bin/thisroot.sh && python2 ${roothome}/PyRDF/introduction.py