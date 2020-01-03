# s3_static_web
Docker image for push static web pages to s3, with compress images and minify HTML/JS/CSS

This image combine 4 components:

1. [s5cmd](https://github.com/peak/s5cmd) for synchronize static web to S3
2. [minify CLI](https://github.com/tdewolff/minify/tree/master/cmd/minify) for minify HTML5, CSS3, JS, JSON, SVG and XML
3. [imagecomp](https://github.com/aprimadi/imagecomp) for compress images PNG, JPG
4. [s3static](https://github.com/cpfriend1721994/s3_static_web) a mix between s5cmd, minify and imagecomp, for push static web pages to s3, with compress images and minify HTML/JS/CSS



## Installation

```bash
  docker pull tunnm/s3_static_web
```



## Usage (s3static)

```bash
  AWS_ACCESS_KEY_ID=<your key> AWS_SECRET_ACCESS_KEY=<your secret> AWS_REGION=<your region>  s3static <directory path> <s3 destination path>
```



### Example:

```bash
  AWS_ACCESS_KEY_ID=xxxxxx AWS_SECRET_ACCESS_KEY=xxxxxx AWS_REGION=ap-southeast-1 s3static $(pwd) s3://xxxxxx/
```
