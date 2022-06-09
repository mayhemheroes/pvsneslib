FROM --platform=linux/amd64 ubuntu:20.04 as builder

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3 gcc-multilib build-essential

ADD . /repo
WORKDIR /repo/tools
RUN make -j8

RUN mkdir -p /deps
RUN ldd /repo/tools/bin2txt/bin2txt | tr -s '[:blank:]' '\n' | grep '^/' | xargs -I % sh -c 'cp % /deps;'

FROM ubuntu:20.04 as package

COPY --from=builder /deps /deps
COPY --from=builder /repo/tools/bin2txt/bin2txt /repo/tools/bin2txt/bin2txt
ENV LD_LIBRARY_PATH=/deps
