#!/bin/bash
set -eo pipefail

# Init Configure
export MINIFY_VERSION=2.6.1
apt-get update
apt-get install -y wget procps lsb-release jpegoptim libjpeg-progs pngcrush optipng advancecomp gifsicle autoconf automake libtool make bc

# Install zImageOptimizer -  https://github.com/zevilz/zImageOptimizer
echo 1 | ./zImageOptimizer.sh -c

# Install Minify CLI - https://github.com/tdewolff/minify/tree/master/cmd/minify
wget https://github.com/tdewolff/minify/releases/download/v${MINIFY_VERSION}/minify_${MINIFY_VERSION}_linux_amd64.tar.gz
tar xzf minify_${MINIFY_VERSION}_linux_amd64.tar.gz
chmod +x minify
mv minify /usr/bin/

# Install S5cmd - https://github.com/peak/s5cmd
go get -u github.com/peakgames/s5cmd

# Clean Install

cd ..
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* LICENSE.md cmd/ minify_${MINIFY_VERSION}_linux_amd64.tar.gz