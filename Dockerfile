# Pistache.io-docker Copyright (C) 2016 Rob Williamson
FROM ubuntu

MAINTAINER Nasim Kabiliravi

WORKDIR /root/build

# add build dependencies & get the code.
RUN apt update
RUN apt -y install git
RUN apt -y install g++
RUN apt -y install make
RUN apt -y install cmake
RUN apt -y install openssl
RUN apt -y install libssl-dev

RUN git clone --recursive https://github.com/corvusoft/restbed.git /src/restbed
RUN  mkdir -p /src/restbed/build
RUN  cd /src/restbed/build && cmake -DBUILD_SSL=ON -DBUILD_TESTS=OFF -DBUILD_SHARED=ON .. && make
