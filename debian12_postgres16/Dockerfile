# by 02/2024 'latest' means 'jammy', that is 22.04
FROM axel9691/debian:12.4-en 

LABEL maintainer 'axelkrebs@online.de'

EXPOSE 5432

COPY pguser.sql .

RUN apt-get update && apt install postgresql postgresql-contrib python3-pip python3-venv -y && service postgresql restart && sudo -u postgres psql -a -f pguser.sql

# Prepare the 'venv' (Python virtual environment) - for user 'vagrant' only!
WORKDIR /home/vagrant
RUN echo "alias python='python3'" > .bash_aliases
RUN echo "alias py3='python3'" >> .bash_aliases
RUN echo "source .venv/bin/activate" >> .bashrc
USER vagrant
RUN ["/bin/bash", "-c", "python3 -m venv .venv"] 

CMD ["/bin/bash", "-c", "sudo -u postgres service postgresql restart && tail -f /dev/null"]

# Keep the container running for testing purposes
# CMD ["/bin/bash", "-c", "tail -f /dev/null"]
