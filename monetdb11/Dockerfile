FROM axel9691/debian:11.6-cmake

LABEL maintainer 'axelkrebs@online.de'

RUN apt-get -y update
# 'recommended' packages
RUN apt install -y libbz2-dev libpcre3-dev libreadline-dev liblzma-dev zlib1g-dev

# install optional features 
# RUN apt install libasan5 libcfitsio-dev libcurl4-gnutls-dev libgdal-dev libgeos-dev libnetcdf-dev libproj-dev libxml2-dev python3-dev python3-numpy r-base-dev unixodbc-dev valgrind

RUN git clone https://github.com/MonetDB/MonetDB.git
WORKDIR /MonetDB
RUN cmake .
WORKDIR $HOME

CMD ["/bin/bash", "-c", "tail -f /dev/null"]