FROM golang:alpine AS builder
WORKDIR /
ENV MINIFY_VERSION 2.6.1
RUN apk add --update wget git linux-headers build-base
RUN wget https://github.com/tdewolff/minify/releases/download/v${MINIFY_VERSION}/minify_${MINIFY_VERSION}_linux_amd64.tar.gz
RUN tar xzf minify_${MINIFY_VERSION}_linux_amd64.tar.gz
RUN chmod +x minify
RUN mv minify /go/bin/
RUN go get -u github.com/peak/s5cmd
COPY go.mod go.sum /
RUN go mod download
ADD . /go/src/github.com/s3_static_web
WORKDIR /go/src/github.com/s3_static_web
RUN go build -o s3static
RUN mv s3static /go/bin/
FROM alpine
RUN apk add --update --no-cache gifsicle jpegoptim pngquant && rm -rf /var/cache/apk/*
COPY --from=builder /go/bin/* /usr/bin/