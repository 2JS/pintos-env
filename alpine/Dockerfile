FROM gcc:5.4.0 as QEMUBUILD

WORKDIR /root
RUN wget https://musl.libc.org/releases/musl-1.2.0.tar.gz \
 && tar xzf musl-1.2.0.tar.gz

WORKDIR musl-1.2.0/build
RUN ../configure --prefix=$PWD && make -j
RUN ln -s /root/musl-1.2.0/build/obj/musl-gcc /usr/local/bin/musl-gcc

WORKDIR /root
RUN git clone -b stable-2.5 --depth=1 git://git.qemu-project.org/qemu.git
# RUN git submodule update --init --recursive --depth=1

WORKDIR qemu/build
RUN ../configure --target-list=x86_64-softmmu --enable-debug --iasl=musl-gcc --extra-cflags="-static -static-libgcc" && make -j


FROM alpine:3.12.0 as alpine

RUN apk update && apk add --no-cache gcc6 make python3 perl
RUN ln -s /usr/bin/gcc-6 /usr/bin/gcc

COPY --from=QEMUBUILD /root/qemu/build/x86_64-softmmu/qemu-system-x86_64 /usr/local/bin/
COPY --from=QEMUBUILD /root/qemu/pc-bios /usr/local/share/qemu/

WORKDIR /root/pintos
ENV PATH="$PATH:/root/pintos/utils"

#CMD ["/bin/bash"]
