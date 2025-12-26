FROM golang:1.23-bookworm AS builder

ENV PROJ_VERSION=8.2.1

RUN set -eux \
    && apt-get update -y \
    && apt-get install --no-install-recommends -y curl gcc g++ byacc libpcre3 libpcre3-dev make autoconf automake ca-certificates wget sqlite3 libsqlite3-dev libtiff-dev libcurl4-openssl-dev cmake liblerc-dev
RUN wget https://download.osgeo.org/proj/proj-${PROJ_VERSION}.tar.gz && tar zxvf proj-${PROJ_VERSION}.tar.gz && cd proj-${PROJ_VERSION} \
    && cmake . \
    && make \
    && make install