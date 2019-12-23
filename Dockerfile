FROM golang:buster
ADD . /
WORKDIR /
RUN ./install.sh
ENTRYPOINT entrypoint.sh
CMD []