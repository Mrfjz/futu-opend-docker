FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install -y wget procps telnet

RUN pip3 install futu-api

ENV SDK_NAME=FutuOpenD_5.7.1908_Ubuntu16.04
RUN wget -q -O - https://software-file-1251001049.file.myqcloud.com/${SDK_NAME}.tar.gz | tar -xzf - -C / \
	&& rm -rf /${SDK_NAME}/${SDK_NAME}.AppImage \
	&& ln -s /${SDK_NAME}/${SDK_NAME} /FutuOpenD

COPY ./FutuOpenD.xml /FutuOpenD/FutuOpenD.xml
COPY ./test_connection.py /FutuOpenD/

WORKDIR /FutuOpenD
