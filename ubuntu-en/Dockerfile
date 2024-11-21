FROM ubuntu:kinetic

LABEL maintainer 'axelkrebs@online.de'

EXPOSE 22

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
#RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt -y update
RUN apt-get install apt-utils locales 

RUN echo "LC_ALL=$LANG" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen "en_US.UTF-8"

RUN echo 'root:Kerber0$' | chpasswd 
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Add user 'vagrant' as application user for deployment in cluster
RUN useradd -m vagrant
RUN usermod -aG sudo vagrant
RUN echo "vagrant:vagrant" | chpasswd
RUN mkdir -p /home/vagrant/.ssh
COPY id_rsa_shared /home/vagrant/.ssh/id_rsa
RUN chown -R vagrant:vagrant /home/vagrant/.ssh
RUN echo "Host remotehost\n\tStrictHostKeyChecking no\n" >> /home/vagrant/.ssh/config

CMD ["/bin/bash", "-c", "tail -f /dev/null"]