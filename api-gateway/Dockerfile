FROM axel9691/graalvm-java11:22.3.1

# Do not install ruby!! GCC et al. will be needed for SSL library in post_install_hook.sh, libxml2 for Nokogiri etc.
RUN microdnf update -y
RUN microdnf install -y gcc git openssl-libs libxslt libxml2 libyaml make patch xz zlib-devel

# GraalVM-Ruby already installed, s. FROM clause

# support for Ruby & SSL libraries 
RUN gu install ruby
RUN ${JAVA_HOME}/languages/ruby/lib/truffle/post_install_hook.sh

# Allow user vagrant to modify Ruby (package installation); TODO check alternative: sudo
RUN chmod a+rwx ${JAVA_HOME} -R

WORKDIR /home/vagrant
ADD ./build/libs/api-gateway.jar .
ADD Gemfile .
ADD Gemfile.lock .
RUN chown vagrant Gemfile
RUN chown vagrant Gemfile.lock
ADD main.rb .
RUN chown vagrant main.rb
USER vagrant
RUN bundle install

EXPOSE 4567

#CMD ["/bin/bash", "-c", "ruby --vm.classpath=api-gateway.jar main.rb"]
CMD ["/bin/bash", "-c", "tail -f /dev/null"]
