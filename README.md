# s3_static_web
Docker image for push static web pages to s3, with compress images and minify HTML/JS/CSS

This image combine 3 components:

1. [s5cmd](https://github.com/peak/s5cmd) for synchronize static web to S3
2. [minify CLI](https://github.com/tdewolff/minify/tree/master/cmd/minify) for minify HTML5, CSS3, JS, JSON, SVG and XML
3. [imagecomp](https://github.com/aprimadi/imagecomp) for compress images PNG, JPG




## Installation

```bash
  docker pull tunnm/s3_static_web
```



## Usage

```bash
  s3static --src <DIRECTORY_PATH> --aws-secret-key xxxxxx --aws-access-key xxxxxx --aws-s3-bucket s3://xxxxxx --enable-minify --enable-compress
```



### Options:

```bash
  --src                 (Mandatory)   Directory of sourcecode
  --aws-secret-key      (Mandatory)   Set AWS Secret Access Key
  --aws-access-key      (Mandatory)   Set AWS Access key ID
  --aws-s3-bucket       (Mandatory)   Set AWS S3 Bucket
  --enable-minify       (Optional)    Enable minify HTML5, CSS3, JS, JSON, SVG and XML
  --enable-compress     (Optional)    Enable compress images
```
