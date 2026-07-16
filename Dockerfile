FROM ubuntu:24.04


ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update


RUN apt-get install -y \
    openjdk-17-jdk \
    maven \
    nodejs \
    npm \
    redis-server \
    mysql-server \
    git \
    curl \
    vim \
    tmux \
    openssh-client


COPY settings.xml /root/.m2/settings.xml


COPY bootstrap /tmp/bootstrap


RUN cd /tmp/bootstrap/spring-demo \
    && mvn dependency:go-offline


RUN cd /tmp/bootstrap/spring-cloud-demo \
    && mvn dependency:go-offline


RUN cd /tmp/bootstrap/spring-ai-demo \
    && mvn dependency:go-offline


RUN cd /tmp/bootstrap/java-extra \
    && mvn dependency:go-offline


RUN npm config set registry https://registry.npmmirror.com


RUN npm install -g pnpm


COPY bootstrap/node-package.json /tmp/package.json


RUN cd /tmp \
    && npm install


COPY start.sh /usr/local/bin/start.sh

COPY mysql-init.sh /usr/local/bin/mysql-init.sh


RUN chmod +x \
    /usr/local/bin/start.sh \
    /usr/local/bin/mysql-init.sh


RUN mkdir -p /workspace


WORKDIR /workspace


CMD ["/usr/local/bin/start.sh"]

