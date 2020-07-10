 
FROM centos:7
MAINTAINER Jacob Zwang <zwang.jacob@gmail.com>

EXPOSE 3012

ENV SOURCES=/sources

RUN yum update -y
RUN yum install -y file gcc openssl-devel
RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --disable-sudo

RUN mkdir -p $SOURCES
ADD ./ $SOURCES

WORKDIR $SOURCES
RUN cargo install rustysignal

CMD cargo rustysignal 127.0.0.1:3012
