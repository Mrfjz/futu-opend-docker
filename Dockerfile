FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y wget procps 

ENV SDK_NAME=FutuOpenD_5.7.1908_Ubuntu16.04
RUN wget -q -O - https://software-file-1251001049.file.myqcloud.com/${SDK_NAME}.tar.gz | tar -xzf - -C / \
	&& rm -rf /${SDK_NAME}/${SDK_NAME}.AppImage \
	&& ln -s /${SDK_NAME}/${SDK_NAME} /FutuOpenD

COPY ./FutuOpenD.xml /FutuOpenD/FutuOpenD.xml
COPY ./start-futu-opend-daemon.sh /FutuOpenD/
COPY ./verify-with-sms.sh /FutuOpenD/

WORKDIR /FutuOpenD
