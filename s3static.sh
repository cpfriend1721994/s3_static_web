#!/bin/sh

usage()
{
  cat << USAGE >&2
Usage:

  s3static --src <DIRECTORY_PATH> --aws-secret-key xxxxxx --aws-access-key xxxxxx --aws-s3-bucket s3://xxxxxx --enable-minify --enable-compress


Options:
  --src                 (Mandatory)   Directory of sourcecode
  --aws-secret-key      (Mandatory)   Set AWS Secret Access Key
  --aws-access-key      (Mandatory)   Set AWS Access key ID
  --aws-s3-bucket       (Mandatory)   Set AWS S3 Bucket
  --enable-minify       (Optional)    Enable minify HTML5, CSS3, JS, JSON, SVG and XML
  --enable-compress     (Optional)    Enable compress images PNG, JPG

USAGE
  exit 1
}

function s3static()
{
  while [[ $# -gt 0 ]]
  do
    case "$1" in
      -k|--key)
          KEY_FILE=$2
          shift 2
      ;;
      -p|--password)
          KEY_PASS=$2
          shift 2
      ;;
      --help)
          usage
      ;;
      *)
          if [[ $# -eq 1 ]]; then
              FILE_PATH=$1
              shift 1
          else
              echoerr "Unknown argument: $1"
              usage
          fi
      ;;
    esac
  done
}