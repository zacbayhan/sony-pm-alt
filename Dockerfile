#FROM alpine:latest
FROM python:3.10-alpine3.15
# lib urls
ENV VERSION_NUM=2.5.27
ENV GPHOTO_URL=https://sourceforge.net/projects/gphoto/files/gphoto/${VERSION_NUM}/gphoto2-${VERSION_NUM}.tar.gz
ENV LIBGPHOTO_URL=https://sourceforge.net/projects/gphoto/files/libgphoto/${VERSION_NUM}/libgphoto2-${VERSION_NUM}.tar.gz
ENV BUILD_DIR=/opt/build


ENV PHOTO_DIR=/var/lib/Sony
WORKDIR /root

#RUN apk add --no-cache wget \
#                        bash \
#                        alpine-sdk \
#                        automake \
#                        autoconf \
#                        gettext-dev \
#                        libtool \
#                        popt-dev \
#                        m4 \
#                        python3 \
#                        py3-pip \
#                        curl-dev \
#                        libusb-dev \
#                        libexif-dev \
#                        libxml2-dev \
#                        gtk-doc \
#                        gd-dev

RUN apk add --no-cache gphoto2 wget bash

#RUN mkdir -p ${BUILD_DIR} /usr/local/docs && \
#    cd ${BUILD_DIR} && \
#    wget ${GPHOTO_URL} && \
#    wget ${LIBGPHOTO_URL} && \
#    tar -xvf libgphoto2-${VERSION_NUM}.tar.gz && \
#    tar -xvf gphoto2-${VERSION_NUM}.tar.gz && \
#    rm *.tar.gz && \
#    ls -l

# Building libgphoto2
#RUN cd ${BUILD_DIR}/libgphoto2-${VERSION_NUM} && \
#    autoreconf --install --symlink

#./configure --prefix=/usr/local --with-doc-dir=/usr/local/docs -enable-docs

RUN mkdir -p ~/.gphoto ${PHOTO_DIR}

ADD gphoto-settings .gphoto/settings

ADD sony-pm-alt.py .

CMD ['/bin/bash']
