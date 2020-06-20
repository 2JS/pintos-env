FROM gcc:5.4.0 AS QEMUBUILD

WORKDIR /root

RUN git clone -b stable-2.5 --depth=1 git://git.qemu-project.org/qemu.git
# RUN git submodule update --init --recursive --depth=1

WORKDIR qemu/build

RUN ../configure --target-list=x86_64-softmmu --enable-debug --enable-kvm --enable-debug-info
RUN make -j6


FROM ubuntu:16.04 AS xenial

LABEL maintainer=lego3410@gmail.com

RUN apt-get update && apt-get upgrade -y

# install gcc 7.5
RUN apt-get install -y software-properties-common \
 && add-apt-repository ppa:ubuntu-toolchain-r/test \
 && apt update \
 && apt install g++-7 -y \
 && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7

RUN apt-get install -y libcurl3 libpixman-1-0 libpng12-0 libjpeg62 libglib2.0-0 make

COPY --from=QEMUBUILD /root/qemu/build/x86_64-softmmu/qemu-system-x86_64 /usr/local/bin/
COPY --from=QEMUBUILD /root/qemu/pc-bios /usr/local/share/qemu/

WORKDIR /root/pintos
