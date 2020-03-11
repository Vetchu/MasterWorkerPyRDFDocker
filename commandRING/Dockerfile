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
RUN mkdir /terraform
ADD main.tf /terraform/main.tf
RUN chmod 777 /terraform -R
# COPY /home/vetch/.ssh/id_rsa.pub /terraform
# RUN export TF_VAR_pub_key="$(cat /terraform/id_rsa.pub)"
RUN useradd -m -d /home/jenkins -r -u 969 jenkins && ls /home/jenkins
USER jenkins

CMD cd /terraform && terraform init &&  terraform apply -auto-approve