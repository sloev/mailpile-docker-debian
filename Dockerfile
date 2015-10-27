#dockerfile for mailpile webmail client

FROM debian:jessie

RUN apt-get update && apt-get install -y \
    git \
    gnupg \
    python \
    openssl \
    python-pip \
    python-lxml


# clone Mailpile, docs and plugins (submodules) to your machine
RUN git clone --recursive -b release/beta https://github.com/pagekite/Mailpile.git

WORKDIR ./Mailpile
# Install missing requirements
RUN pip install -r requirements.txt

# Initial Mailpile setup
RUN ./mp setup

CMD MAILPILE_HOME=/var/mailpile ./mp --www=0.0.0.0:33411 --wait
EXPOSE 33411

VOLUME /var/mailpile
VOLUME /var/mailpile/.gnupg
