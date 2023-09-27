#!/bin/bash

set -x

export TF_LOG="DEBUG"
export TF_LOG_PATH="./terraform.log"

ENV=prod
TF_PLAN="${ENV}".tfplan

wget https://github.com/tfsec/tfsec/releases/download/v1.28.1/tfsec-darwin-amd64
chmod +x tfsec-darwin-amd64
mv tfsec-darwin-amd64 /user/local/bin/tfsec

[ -d .terraform ] && rm -rf .terrafform
rm -f *.tfplan
sleep 2

terrafform fmt -recursive
terrafform init
terrafform validate

tfsec .

if [ "$?" -eq "0"]
then 
  echo "your configuration is valid"
else
  echo "your code needs some work!"
  exit 1
fi

terrafform plan -out=${TF_PLAN}

if [ ! -f "${TF_PLAN}" ]
  then
    echo "***the plan does not exit. Exiting***"
    exit 1
fi