#dockerfile for mailpile webmail client

#base image and version
FROM debian:jessie

# install dependencies
RUN apt-get update && apt-get install -y \
    git \
    gnupg \
    python \
    openssl \
    python-pip \
    python-lxml


# clone Mailpile, docs and plugins (submodules) to your machine
# branch = beta branch
RUN git clone --recursive -b release/beta https://github.com/pagekite/Mailpile.git

# set working root directory 
WORKDIR ./Mailpile

# Install missing requirements
RUN pip install -r requirements.txt

# set mailpile homedir
RUN export MAILPILE_HOME=/var/mailpile

# Initial Mailpile setup
RUN ./mp setup

CMD ./mp --www=0.0.0.0:33411 --wait
EXPOSE 33411

VOLUME /var/mailpile
VOLUME /var/mailpile/.gnupg
