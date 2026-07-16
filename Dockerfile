FROM gitpod/workspace-full

USER root

RUN apt update && apt install -y \
    openjdk-21-jdk \
    maven \
    redis-tools \
    mysql-client \
    postgresql-client

WORKDIR /workspace

CMD ["/bin/bash"]
