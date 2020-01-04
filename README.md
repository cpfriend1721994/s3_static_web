# s3_static_web
Docker image for push static web pages to s3, with compress images and minify HTML/JS/CSS

This image combine 3 components:

1. [s5cmd](https://github.com/peak/s5cmd) for synchronize static web to S3
2. [minify CLI](https://github.com/tdewolff/minify/tree/master/cmd/minify) for minify HTML5/CSS3/JS/JSON/SVG/XML
3. [s3static](https://github.com/cpfriend1721994/s3_static_web) a mix between s5cmd, minify and some image tools (gifsicle/jpegoptim/pngquant), for push static web pages to s3, with compress images and minify HTML5/CSS3/JS/JSON/SVG/XML



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
