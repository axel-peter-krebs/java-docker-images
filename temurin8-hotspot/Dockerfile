FROM axel9691/almalinux:9.1-en

RUN microdnf update -y 
RUN microdnf -y install procps wget

#RUN wget https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u372-b07/OpenJDK8U-jdk_x64_linux_hotspot_8u372b07.tar.gz
COPY OpenJDK8U-jdk_x64_linux_hotspot_8u372b07.tar.gz .
COPY OpenJDK8U-jdk_x64_linux_hotspot_8u372b07.tar.gz.json .
RUN tar -xvf OpenJDK8U-jdk_x64_linux_hotspot_8u372b07.tar.gz
#RUN mv apache-maven-3.9.2 /opt

CMD ["/bin/bash", "-c", "tail -f /dev/null"]