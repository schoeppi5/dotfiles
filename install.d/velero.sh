#!/bin/bash

temp_dir=$(mktemp -d)

curl -fsSL https://github.com/vmware-tanzu/velero/releases/download/v1.9.0/velero-v1.9.0-linux-amd64.tar.gz -o $temp_dir/velero.tar.gz

tar -xvf $temp_dir/velero.tar.gz -C $temp_dir

mv $temp_dir/