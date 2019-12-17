FROM debian:stretch-slim
MAINTAINER tunnm (cpfriend1721994@gmail.com)
ENV MINIFY_VERSION 2.6.1
ENV S3CMD_VERSION 2.0.2
COPY * ./
WORKDIR /
RUN ./install.sh
CMD cmd.sh