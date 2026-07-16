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

WORKDIR /workspace

CMD ["/bin/bash"]
