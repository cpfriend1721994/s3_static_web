FROM golang:alpine
ADD . /
WORKDIR /
RUN ./install.sh
ENTRYPOINT entrypoint.sh
CMD []