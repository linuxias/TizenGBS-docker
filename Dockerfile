FROM ubuntu:16.04
LABEL maintainer = "Seungha Son <linuxias@gmail.com>"
ARG USER=gbs-builder
ARG GROUP=gbs-builder
ARG UID=1000
ARG GID=1000
ARG PW=gbs-builder

RUN echo "deb [trusted=yes] http://download.tizen.org/tools/latest-release/Ubuntu_16.04/ /" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install gbs -y
RUN apt-get upgrade -y
RUN groupadd -r ${GROUP} && \
		useradd --create-home --shell /bin/bash -g ${GROUP} --uid ${UID} ${USER} && \
		echo "${USER}:${PW}" | chpasswd

ADD https://github.com/linuxias/TizenGBS-docker/blob/master/gbs.conf /home/${USER}/.gbs.conf
RUN chown ${USER}:${GROUP} /home/gbs-builder/.gbs.conf

USER gbs-builder
WORKDIR /home/${USER}
