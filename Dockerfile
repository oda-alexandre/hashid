FROM debian:stretch-slim

LABEL authors https://www.oda-alexandre.com

ENV USER hashid
ENV HOME /home/${USER}
ENV DEBIAN_FRONTEND noninteractive

RUN echo -e '\033[36;1m ******* TEST USER VARIABLE ******** \033[0m' && \ 
  echo ${USER}

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m' && \
  apt-get update && apt-get install --no-install-recommends -y \
  ca-certificates \
  sudo \
  python3 \
  python3-setuptools

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m' && \
  easy_install3 pip && \
  pip install hashid

RUN echo -e '\033[36;1m ******* CLEANING ******** \033[0m' && \
  apt-get --purge autoremove -y && \
  rm /etc/apt/sources.list && \
  rm -rf /var/cache/apt/archives/* && \
  rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m' && \
  useradd -d ${HOME} -m ${USER} && \
  passwd -d ${USER} && \
  adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR ${HOME}

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD /bin/bash \