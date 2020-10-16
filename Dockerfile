## Pull base image.
FROM ubuntu:18.04

# Silence debconf messages
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install build dependencies.
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get clean && apt-get -qq update && apt-get -y install \
    byobu curl git htop man vim wget unzip \
    build-essential \
    openjdk-11-jdk \
    python3 \
    python3-pip \
    npm \
    ca-certificates-java \
    expect && \
    rm -rf /var/lib/apt/lists/*

# Install Bazelisk
RUN npm install --global @bazel/bazelisk
