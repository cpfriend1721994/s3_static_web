#!/bin/bash
set -eo pipefail

# Init Configure
apt-get update
apt-get install -y python3 wget procps lsb-release python3-setuptools jpegoptim libjpeg-progs pngcrush optipng advancecomp gifsicle autoconf automake libtool make bc

# Install zImageOptimizer -  https://github.com/zevilz/zImageOptimizer

echo 1 | ./zImageOptimizer.sh -c

# Install Minify CLI - https://github.com/tdewolff/minify/tree/master/cmd/minify

wget https://github.com/tdewolff/minify/releases/download/v${MINIFY_VERSION}/minify_${MINIFY_VERSION}_linux_amd64.tar.gz
tar xzf minify_${MINIFY_VERSION}_linux_amd64.tar.gz
chmod +x minify
mv minify /usr/bin/
rm -rf LICENSE.md cmd/ minify_${MINIFY_VERSION}_linux_amd64.tar.gz

# Install S3cnd - https://github.com/s3tools/s3cmd

wget https://sourceforge.net/projects/s3tools/files/s3cmd/${S3CMD_VERSION}/s3cmd-${S3CMD_VERSION}.tar.gz
tar xzf s3cmd-${S3CMD_VERSION}.tar.gz
cd s3cmd-${S3CMD_VERSION}
python3 setup.py install
cd ..
rm -rf s3cmd-${S3CMD_VERSION}/ s3cmd-${S3CMD_VERSION}.tar.gz

# Clean Install

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
