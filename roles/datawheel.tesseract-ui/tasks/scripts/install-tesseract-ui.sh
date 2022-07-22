#!/bin/bash -eux

# tesseract-ui-server variable
TESSERACT_SERVER=$1
#TESSERACT_NAME=$2

# check if directory exists and create it
[ -d "/home/deploy/tesseract-ui" ] && rm -rf /home/deploy/tesseract-ui
[ ! -d "/home/deploy/tesseract-ui" ] && mkdir /home/deploy/tesseract-ui

# tesseract-ui
npm init @datawheel/tesseract-ui tesseract-ui \
  --env="production" \
  --server=$TESSERACT_SERVER 
  