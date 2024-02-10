FROM ubuntu:jammy

LABEL maintainer 'axelkrebs@online.de'

EXPOSE 22

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
#ENV LC_ALL=en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
#RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt -y update
RUN apt -y upgrade
RUN apt-get install -y apt-utils autoconf automake bison cmake curl dpkg-dev gcc git libssl-dev libtool libz-dev locales make wget

RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen en_US.UTF-8

CMD ["/bin/bash", "-c", "tail -f /dev/null"]
