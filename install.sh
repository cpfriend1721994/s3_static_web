#!/bin/sh
set -eo pipefail

# Init
echo "options ndots:1\nnameserver 8.8.8.8\nnameserver 8.8.4.4" >> /etc/resolv.conf
apk add --update --virtual build-dependencies bash gcc musl-dev openssl ca-certificates git

# Install Minify CLI
export MINIFY_VERSION=2.6.1
wget https://github.com/tdewolff/minify/releases/download/v${MINIFY_VERSION}/minify_${MINIFY_VERSION}_linux_amd64.tar.gz
tar xzf minify_${MINIFY_VERSION}_linux_amd64.tar.gz
chmod +x minify
mv minify /usr/bin/

# Install s5cmd
go get -u github.com/peak/s5cmd

# Install liliput
go get -u github.com/discordapp/lilliput

# Clean Install
apk del build-dependencies
rm -rf/var/cache/apk/* /tmp/* /var/tmp/* LICENSE.md cmd/ minify_${MINIFY_VERSION}_linux_amd64.tar.gz