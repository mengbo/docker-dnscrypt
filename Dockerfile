FROM ubuntu:14.04

MAINTAINER Meng Bo "mengbo@lnu.edu.cn"

RUN echo "deb http://cn.archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install curl build-essential

RUN mkdir -p /usr/local/src;\
  cd /usr/local/src;\
  curl https://download.libsodium.org/libsodium/releases/libsodium-0.5.0.tar.gz | tar xz;\
  cd libsodium*;\
  ./configure;\
  make && make check;\
  make install

RUN echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf;\
  ldconfig;

RUN mkdir -p /usr/local/src;\
  cd /usr/local/src;\
  curl http://download.dnscrypt.org/dnscrypt-proxy/dnscrypt-proxy-1.4.0.tar.bz2 | tar xj;\
  cd dnscrypt-proxy*;\
  ./configure && make -j2;\
  make install

EXPOSE 53
EXPOSE 53/udp

CMD /usr/local/sbin/dnscrypt-proxy --local-address=0.0.0.0:53 --resolver-name=opendns
