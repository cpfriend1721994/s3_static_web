FROM golang:alpine AS builder
WORKDIR /
ENV MINIFY_VERSION 2.6.1
RUN apk add --update wget git linux-headers build-base pngquant
ADD https://github.com/tdewolff/minify/releases/download/v${MINIFY_VERSION}/minify_${MINIFY_VERSION}_linux_amd64.tar.gz ./
RUN tar xzf minify_${MINIFY_VERSION}_linux_amd64.tar.gz
RUN chmod +x minify
RUN mv minify /usr/bin/
RUN go get -u github.com/peak/s5cmd
RUN mv /go/bin/s5cmd /usr/bin/
RUN go get github.com/pierrec/lz4 && cd /go/src/github.com/pierrec/lz4 && git fetch && git checkout v3.0.1
RUN go get github.com/aprimadi/imagecomp
RUN go install github.com/aprimadi/imagecomp
RUN mv /go/bin/imagecomp /usr/bin/
FROM alpine
COPY --from=bethrezen/mozjpeg-docker /usr/local/bin/* /usr/bin/
COPY --from=builder /usr/bin/* /usr/bin/