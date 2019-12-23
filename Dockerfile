FROM debian:stretch-slim
ADD . /
WORKDIR /
RUN ./install.sh
ENTRYPOINT entrypoint.sh
CMD []