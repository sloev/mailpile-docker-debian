FROM debian:jessie

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y git openssl python-imaging python-jinja2 python-lxml libxml2-dev python-pgpdump

# Add code
RUN git clone --recursive -b release/beta https://github.com/pagekite/Mailpile.git
WORKDIR /Mailpile

# Initialize mailpile
RUN ./mp setup

# Entrypoint
CMD ./mp --www=0.0.0.0:33411 --wait
EXPOSE 33411

# Volumes
VOLUME /root/.local/share/Mailpile
VOLUME /root/.gnupg
