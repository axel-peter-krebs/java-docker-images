# 'bookworm-slim' is the same as 12.4-slim (10.02.2024)
FROM axel9691/debian:12.4-en

# install couchbase 7.6 as root
WORKDIR /root
RUN curl -O https://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-noarch.deb
RUN dpkg -i ./couchbase-release-1.0-noarch.deb
RUN apt-get update
RUN apt-get install couchbase-server

EXPOSE 9119 9998 11213 21200 21300
# EXPOSE 21250,21350 encrypted
EXPOSE 8091 18091

CMD ["/bin/bash", "-c", "tail -f /dev/null"]
