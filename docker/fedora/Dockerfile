FROM fedora:latest
LABEL maintainer="kobenairb <kobenairb@gmail.com>"

ENV TERM xterm
ENV PVSNESLIB_HOME $(pwd)
ENV PS1A="[\d \[\e[33m\]\t\[\e[m\]] \[\e[31m\]\u\[\e[m\]@\[\e[31m\]\h\[\e[m\] \[\e[36m\]\w\[\e[m\]\n $ "
ENV DISTRO $DISTRO

RUN echo 'PS1=$PS1A' >> ~/.bashrc

RUN echo "minrate=30k" >> /etc/dnf/dnf.conf

RUN echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf

RUN sed -i 's|enabled=1|enabled=0|g' /etc/yum.repos.d/fedora-cisco-openh264.repo

RUN sed -i 's|enabled=1|enabled=0|g' /etc/yum.repos.d/fedora-modular.repo

RUN dnf -y upgrade && \
    dnf -y groupinstall "Development Tools" && \
    dnf -y install glibc-devel.i686 \
        cmake\
        gcc-c++ \
        python \
        glibc-static \
        libstdc++-static

CMD ./docker/scripts/container.sh "${PVSNESLIB_HOME}" "${DISTRO}"
