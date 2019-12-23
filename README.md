# s3_static_web
Docker image for push static web pages to s3, with compression

This image contains:

1. [zImageOptimizer](https://github.com/zevilz/zImageOptimizer) for compress images
2. [minify CLI](https://github.com/tdewolff/minify/tree/master/cmd/minify) for minify html, js, css
3. [s3cmd](https://github.com/s3tools/s3cmd) for synchronize static web to S3




## Installation

```bash
docker pull tunnm/s3_static_web
```



## Usage

```bash
s3static --aws-secret-key xxxxxx --aws-access-key xxxxxx --aws-s3-bucket s3://xxxxxx --enable-minify --enable-compress
```



### Options:

```bash
--aws-secret-key      (Mandatory) Set AWS Secret Access Key
--aws-access-key      (Mandatory) Set AWS Access key ID
--aws-s3-bucket       (Mandatory) Set AWS S3 Bucket
--enable-minify       (Optional) Enable minify HTML5, CSS3, JS, JSON, SVG and XML
--enable-compress     (Optional) Enable compress images
```
