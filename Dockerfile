FROM node:10.4
MAINTAINER Rowell Pica <rowellpica@gmail.com>
# Replace shell with bash so we can source files
#RUN rm /bin/sh && ln -s /bin/bash /bin/sh
SHELL ["/bin/bash", "-c"]
# 1.2 Install Environments
# 1.2.1 Install dependencies
RUN apt-get update && \
  apt-get -y install git openssl libssl-dev libkrb5-dev cmake wget curl && \
  apt-get -y install build-essential sudo python vim && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
ARG USERNAME=nodeuser
# Replace following with your user id
ARG USERID=501
# user's home dir should be mapped from EFS
RUN useradd --create-home -s /bin/bash --no-user-group -u $USERID $USERNAME && \
  adduser $USERNAME sudo && \
  echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN su - $USERNAME -c "touch mine"
CMD ["tail", "-f", "/dev/null"]