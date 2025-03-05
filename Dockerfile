FROM jenkins/ssh-agent:debian-jdk17

RUN apt-get update \
        && apt-get install -y wget unzip curl

WORKDIR /home/jenkins/awscli

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

USER jenkins

WORKDIR /home/jenkins/terraform

RUN wget "https://releases.hashicorp.com/terraform/1.10.4/terraform_1.10.4_linux_amd64.zip"
RUN unzip terraform_1.10.4_linux_amd64.zip

USER root
