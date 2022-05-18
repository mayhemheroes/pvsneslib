FROM --platform=linux/amd64 ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3 gcc-multilib build-essential

ADD . /repo
WORKDIR /repo/tools
RUN make -j8
