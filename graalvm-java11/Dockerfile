FROM axel9691/almalinux:9.1-gcc

RUN microdnf update -y 

# Install GraalVM-Ruby runtime as root
#RUN wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-22.3.1/graalvm-ce-java11-linux-amd64-22.3.1.tar.gz
COPY graalvm-ce-java11-linux-amd64-22.3.2.tar.gz .
RUN tar -xvf graalvm-ce-java11-linux-amd64-22.3.2.tar.gz
RUN mv graalvm-ce-java11-22.3.1 /opt
RUN rm graalvm-ce-java11-linux-amd64-22.3.2.tar.gz
ENV JAVA_HOME=/opt/graalvm-ce-java11-22.3.2
ENV PATH="${PATH}:${JAVA_HOME}/bin"

CMD ["/bin/bash", "-c", "tail -f /dev/null"]