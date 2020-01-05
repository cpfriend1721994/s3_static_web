# s3_static_web
Docker image for push static web pages to s3, with compress images and minify HTML/JS/CSS




## Features

This image combine 3 components:

1. [s5cmd](https://github.com/peak/s5cmd) for synchronize static web to S3
2. [minify CLI](https://github.com/tdewolff/minify/tree/master/cmd/minify) for minify HTML5/CSS3/JS/JSON/SVG/XML
3. [s3static](https://github.com/cpfriend1721994/s3_static_web) a mix between s5cmd, minify and some image tools (gifsicle/jpegoptim/pngquant), for push static web pages to s3, with compress images and minify HTML5/CSS3/JS/JSON/SVG/XML



## Installation

```bash
docker pull tunnm/s3_static_web
```



## Usage

```bash
s3static <directory path> <s3 destination path>
```



### Configuration

```bash
# Configuration through environment variables (Mandatory):
AWS_ACCESS_KEY_ID=<your key>
AWS_SECRET_ACCESS_KEY=<your secret>
AWS_REGION=<your region>
```



### Example

```bash
# s3static standalone
AWS_ACCESS_KEY_ID=xxxxxx AWS_SECRET_ACCESS_KEY=xxxxxx AWS_REGION=ap-southeast-1 s3static $(pwd) s3://xxxxxx/

# s3static with docker
docker run -v $(pwd):/input --rm --env AWS_ACCESS_KEY_ID=xxxxxx --env AWS_SECRET_ACCESS_KEY=xxxxxx --env AWS_REGION=ap-southeast-1 tunnm/s3_static_web s3static /input s3://xxxxxx/
```
