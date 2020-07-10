 
FROM centos:7
MAINTAINER Jacob Zwang <zwang.jacob@gmail.com>

EXPOSE 3012

ENV SOURCES=/sources

RUN yum update -y
RUN yum install -y file gcc openssl-devel
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

RUN source $HOME/.cargo/env

WORKDIR $SOURCES
RUN cargo install rustysignal

CMD cargo rustysignal 127.0.0.1:3012
