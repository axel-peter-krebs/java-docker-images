FROM axel9691/fedora:38-en

LABEL maintainer 'axelkrebs@online.de'

EXPOSE 22

RUN dnf upgrade -y
RUN dnf -y install autoconf automake cmake gcc glibc-locale-source glibc-langpack-en libtool libyaml make openssl-devel sudo tar zlib

CMD ["/bin/bash", "-c", "tail -f /dev/null"]
