FROM shvid/ubuntu-golang:1.12.2-17c7499
MAINTAINER Alex Shvid <alex@shvid.com>
ARG DS_VER

RUN apt-get install -y xz-utils make gcc g++ && \
    echo "Download DeepSpeech" && \
    wget -O /usr/local/include/deepspeech.h -q https://raw.githubusercontent.com/mozilla/DeepSpeech/v${DS_VER}/native_client/deepspeech.h && \
    wget -q https://github.com/mozilla/DeepSpeech/releases/download/v${DS_VER}/native_client.amd64.cpu.linux.tar.xz && \
    tar -C /usr/local/lib -xf native_client.amd64.cpu.linux.tar.xz libdeepspeech.so && \
    rm native_client.amd64.cpu.linux.tar.xz

ENV LD_LIBRARY_PATH=/usr/local/lib
