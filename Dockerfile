FROM gitpod/workspace-full

USER root

RUN apt update

RUN apt install -y openjdk-17-jdk

RUN apt install -y maven

RUN apt install -y nodejs npm

RUN apt install -y redis-server

RUN apt install -y mysql-server

COPY start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh

WORKDIR /workspace

CMD ["/usr/local/bin/start.sh"]
