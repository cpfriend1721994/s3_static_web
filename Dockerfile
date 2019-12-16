FROM debian:stretch-slim
MAINTAINER tunnm (cpfriend1721994@gmail.com)
COPY * ./
WORKDIR /
RUN ./install.sh
CMD cmd.sh