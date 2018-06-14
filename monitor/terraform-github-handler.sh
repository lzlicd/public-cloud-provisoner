#!/bin/bash

while :
do
	echo "git pull"
        cd /Users/lizhang.li/lzlicd/public-cloud-provisoner/
        git pull
        cd /Users/lizhang.li/lzlicd/public-cloud-provisoner/vendors/gcp
        terraform init
        terraform apply -auto-approve
	sleep 2
done
