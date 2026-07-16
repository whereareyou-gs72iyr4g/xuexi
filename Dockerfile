FROM gitpod/workspace-full

USER root

RUN cat /etc/os-release

RUN apt-get update

CMD ["/bin/bash"]
