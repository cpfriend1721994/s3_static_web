#!/bin/bash

apt-get update

# Install zImageOptimizer -  https://github.com/zevilz/zImageOptimizer

./zImageOptimizer.sh -c

# Install Minify - https://github.com/tdewolff/minify/tree/master/cmd/minify



# Install S3cnd - https://github.com/s3tools/s3cmd



# Clean Install

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*