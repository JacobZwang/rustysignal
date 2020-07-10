FROM rust:1.31

WORKDIR /usr/src/myapp
COPY . .

RUN cargo install rustysignal

CMD rustysignal 127.0.0.1:30012
