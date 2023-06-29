#!/bin/bash
# Remove the GraalVM installation, and Gradle (from Native Image)

rm -R /opt/graalvm-ce-java17-22.3.2
rm -R /opt/gradle-8.1.1
mv /home/vagrant/_bashrc_old /home/vagrant/.bashrc
rm /home/vagrant/_bashrc_old
