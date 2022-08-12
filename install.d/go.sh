#!/bin/bash

temp_dir=$(mktemp -d )

curl -fsSL https://go.dev/dl/go1.19.linux-amd64.tar.gz -o $temp_dir/go.tar.gz

if [ -d /usr/local/go ]; then
    rm -rf /usr/local/go
fi

tar -C /usr/local -xzf $temp_dir/go.tar.gz