FROM ubuntu:14.04

# Install Node.js
RUN apt-get update && apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update && apt-get install -y libstdc++-4.9-dev

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Install Java
RUN add-apt-repository ppa:openjdk-r/ppa
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk:i386

# Clean Dependencies
# RUN apt-get remove curl -y \
#     && apt-get -y autoremove \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /workspace