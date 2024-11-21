FROM almalinux:9.1-minimal

LABEL maintainer 'axelkrebs@online.de'

EXPOSE 22

ENV LANG=en_US.UTF-8

RUN microdnf upgrade -y
RUN microdnf -y install glibc-langpack-en libyaml openssl-devel passwd tar usermode zlib
#RUN localectl set-locale LANG=en_US.UTF-8
#RUN localedef --verbose --force -i en_US -f UTF-8 en_US.UTF-8
RUN source /etc/profile.d/lang.sh

RUN echo 'Kerber0$' | passwd --stdin root  
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