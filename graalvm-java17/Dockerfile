FROM axel9691/almalinux:9.3-en

RUN microdnf update -y 
RUN microdnf -y install findutils unzip wget

# Install GraalVM runtime as root
#RUN wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-22.3.2/graalvm-ce-java17-linux-amd64-22.3.2.tar.gz
COPY graalvm-ce-java17-linux-amd64-22.3.2.tar.gz .
COPY graalvm-ce-java17-linux-amd64-22.3.2.tar.gz.sha256 .
RUN tar -xvf graalvm-ce-java17-linux-amd64-22.3.2.tar.gz
RUN mv graalvm-ce-java17-22.3.2 /opt
RUN rm graalvm-ce-java17-linux-amd64-22.3.2.tar.gz
RUN rm graalvm-ce-java17-linux-amd64-22.3.2.tar.gz.sha256
ENV JAVA_HOME=/opt/graalvm-ce-java17-22.3.2
ENV PATH="${PATH}:${JAVA_HOME}/bin"

# native image install is about 10 MB
RUN gu install native-image

RUN wget https://services.gradle.org/distributions/gradle-8.1.1-bin.zip -P .
#COPY gradle-8.1.1-bin.zip .
RUN unzip -d /opt gradle-8.1.1-bin.zip
RUN rm gradle-8.1.1-bin.zip
ENV GRADLE_HOME=/opt/gradle-8.1.1
ENV PATH="${PATH}:${GRADLE_HOME}/bin"

WORKDIR /home/vagrant

COPY uninstall.sh .
RUN chmod a+x uninstall.sh

USER vagrant

# Install Gradle completion bash script for user vagrant; 
#RUN mkdir bash_completion.d && cd bash_completion.d
#RUN curl -LA gradle-completion https://edub.me/gradle-completion-bash -o gradle-completion.bash
#RUN chown vagrant gradle-completion.bash
#RUN chmod u+rwx gradle-completion.bash & cd ..
#RUN cp .bashrc _bashrc_old
#RUN echo "source $HOME/bash_completion.d/gradle-completion.bash" >> .bashrc
#RUN echo "export PATH=\"\$PATH:/opt/gradle-8.1.1/bin\"" >> .profile
#RUN . ~/.profile

CMD ["/bin/bash", "-c", "tail -f /dev/null"]