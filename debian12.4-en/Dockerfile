# 'bookworm-slim' is the same as 12.4-slim (10.02.2024)
FROM debian:bookworm-slim 

# Install essential networking and ssl features, locales; set up users

LABEL maintainer 'axelkrebs@online.de'

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN apt-get -y upgrade 
RUN apt-get -y update 
RUN apt install -y apt-utils curl gpg libssl-dev locales lsb-release sudo wget 

RUN echo "LC_ALL=$LANG" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen "en_US.UTF-8"
#RUN update-locale LANG=en_US.UTF-8

#RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
#RUN echo "LANG=\"en_US.UTF-8\"" > /etc/default/locale
#RUN dpkg-reconfigure locales

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
