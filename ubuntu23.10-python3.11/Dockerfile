# by 02/2024 'mantic' is 23.10
FROM ubuntu:mantic 

# This machine is intended for deployment in clusters resp. 'swarms'.
# It provides access via SSH, as well a user login ('vagrant').
# The login-user must be able to execute Python(3) in a virtual environment ('venv'). 

LABEL maintainer 'axelkrebs@online.de'

EXPOSE 22

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
#RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get -y update
RUN apt -y install curl gpgv2 libssl-dev locales lsb-release nano openssh-server python3 python3-pip python3-pip-whl python3.11-venv sudo wget 

RUN echo "LC_ALL=$LANG" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen "en_US.UTF-8"

RUN echo 'root:Kerber0$' | chpasswd 
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Add a user 'vagrant' as an application user.
# Add a 'id_rsa' to make the machine accessible from e.g. PuTTY via public key
RUN useradd -m vagrant
RUN usermod -aG sudo vagrant
RUN echo "vagrant:vagrant" | chpasswd
WORKDIR /home/vagrant
RUN mkdir -p .ssh
COPY id_rsa_shared .ssh/id_rsa
RUN chown -R vagrant:vagrant .ssh
RUN echo "Host remotehost\n\tStrictHostKeyChecking no\n" >> .ssh/config

# Prepare the 'venv' (Python virtual environment)
RUN echo "alias python='python3'" > .bash_aliases
RUN echo "alias py3='python3'" >> .bash_aliases
RUN echo "source .venv/bin/activate" >> .bashrc
USER vagrant
RUN ["/bin/bash", "-c", "python3 -m venv .venv"] 

CMD ["/bin/bash", "-c", "tail -f /dev/null"]