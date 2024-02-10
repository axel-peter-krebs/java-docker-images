# 'rawhide' means v. 40
FROM fedora:rawhide

LABEL maintainer 'axelkrebs@online.de'

EXPOSE 22

ENV LANG=en_US.UTF-8

RUN dnf upgrade -y
RUN dnf -y install curl glibc-locale-source glibc-langpack-en libyaml openssl-devel sudo tar wget zlib
#RUN localectl set-locale LANG=en_US.UTF-8
#RUN localedef --verbose --force -i en_US -f UTF-8 en_US.UTF-8
RUN source /etc/profile.d/lang.sh

RUN echo 'root:Kerber0$' | chpasswd 
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# # Add user 'vagrant' as application user for deployment in cluster
RUN useradd -m vagrant
RUN usermod -aG wheel vagrant
RUN echo "vagrant:vagrant" | chpasswd
RUN mkdir -p /home/vagrant/.ssh
COPY id_rsa_shared /home/vagrant/.ssh/id_rsa
RUN chown -R vagrant:vagrant /home/vagrant/.ssh
RUN echo "Host remotehost\n\tStrictHostKeyChecking no\n" >> /home/vagrant/.ssh/config

CMD ["/bin/bash", "-c", "tail -f /dev/null"]