#!/bin/bash

# Init Configure
export MINIFY_VERSION=2.6.1
export S3CMD_VERSION=2.0.2
apt-get update
apt-get install -y python

# Install zImageOptimizer -  https://github.com/zevilz/zImageOptimizer

./zImageOptimizer.sh -c

# Install Minify CLI - https://github.com/tdewolff/minify/tree/master/cmd/minify

wget https://github.com/tdewolff/minify/releases/download/v${MINIFY_VERSION}/minify_${MINIFY_VERSION}_linux_amd64.tar.gz
tar xzf minify_${MINIFY_VERSION}_linux_amd64.tar.gz
chmod +x minify
mv minify /usr/bin/

# Install S3cnd - https://github.com/s3tools/s3cmd

wget https://sourceforge.net/projects/s3tools/files/s3cmd/${S3CMD_VERSION}/s3cmd-${S3CMD_VERSION}.tar.gz
tar xzf s3cmd-${S3CMD_VERSION}.tar.gz
cd s3cmd-${S3CMD_VERSION}
python setup.py install

# Clean Install

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*