FROM arm64v8/ubuntu:22.04

RUN apt-get update -y && apt-get install -y \
       --no-install-recommends \
       automake	\
       bash-completion	\
       bc \
       bison \
       build-essential \
       ca-certificates \
       cmake \
       curl \
       dpkg-sig \
       flex \
       golang-go \
       g++ \
       gcc \
       git \
       jq \
       libc6-dev \
       libssl-dev \
       libsystemd-dev \
       libyaml-dev \
       mercurial \
       net-tools \
       pkg-config \
       python3-dev \
       python3-pip \
       swig \
       wget
