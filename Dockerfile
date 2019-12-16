FROM debian:stretch-slim
MAINTAINER tunnm (cpfriend1721994@gmail.com)
COPY install.sh cmd.sh ./
WORKDIR /
RUN install.sh
CMD cmd.sh