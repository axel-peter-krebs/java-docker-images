FROM axel9691/almalinux:9.1-en

RUN microdnf update -y 
RUN microdnf -y install java-11-openjdk-devel procps wget

RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.2/binaries/apache-maven-3.9.2-bin.tar.gz
RUN tar -xvf apache-maven-3.9.2-bin.tar.gz 
RUN mv apache-maven-3.9.2 /opt

ENV MAVEN_HOME=/opt/apache-maven-3.9.2
ENV PATH="${PATH}:${MAVEN_HOME}/bin"

CMD ["/bin/bash", "-c", "tail -f /dev/null"]