FROM ubuntu:24.04

RUN apt update && apt install -y openssh-server sudo
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN useradd -m -s /bin/bash bilbo && usermod -aG sudo bilbo
RUN echo "bilbo:insecure_password" | chpasswd

EXPOSE 22

ENTRYPOINT service ssh start && bash