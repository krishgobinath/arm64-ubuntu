ROM arm64v8/ubuntu:22.04

RUN apt-get update -y && apt-get install -y \
       --no-install-recommends \
       automake \
       bash-completion  \
       bc \
       bison \
       build-essential \
       ca-certificates \
       cmake \
       cpio \
       curl \
       dpkg-sig \
       file \
       flex \
       golang-go \
       g++ \
       gcc \
       git \
       jq \
       kpartx \
       libc6-dev \
       libssl-dev \
       libsystemd-dev \
       libyaml-dev \
       mercurial \
       net-tools \
       pkg-config \
       python3-dev \
       python3-pip \
       rsync \
       swig \
       qemu-system \
       u-boot-tools \
       unzip \
       vim \
       wget

RUN mkdir -p /root/arm-toolchains
RUN pip3 install parse
WORKDIR  /root/arm-toolchains

RUN wget -qO arm-none-linux-gnueabi.tar.xz https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz

RUN wget -qO arm-none-eabi.tar.xz  https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-aarch64-arm-none-eabi.tar.xz

RUN wget -qO bare-metal.tar.xz https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-aarch64-aarch64-none-elf.tar.xz

RUN tar -xf bare-metal.tar.xz \
    && tar -xf arm-none-eabi.tar.xz \
    && tar -xf arm-none-linux-gnueabi.tar.xz

RUN echo 'export PATH="$PATH:/etc/profile:/root/arm-toolchains/arm-gnu-toolchain-12.2.rel1-aarch64-arm-none-eabi/bin:/root/arm-toolchains/arm-gnu-toolchain-12.2.rel1-aarch64-arm-none-linux-gnueabihf/bin:/root/arm-toolchains/arm-gnu-toolchain-12.2.rel1-aarch64-aarch64-none-elf/bin"' >> /root/.bashrc

RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/bin v1.51.2

WORKDIR  /root
