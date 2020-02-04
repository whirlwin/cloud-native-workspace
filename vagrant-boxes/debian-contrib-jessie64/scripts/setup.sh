#!/usr/bin/env bash

GO_VERSION="go1.13.7"

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y git

wget https://dl.google.com/go/$GO_VERSION.linux-amd64.tar.gz
tar -xvf $GO_VERSION.linux-amd64.tar.gz
sudo mv go /usr/local
rm $GO_VERSION.linux-amd64.tar.gz

echo "export GOROOT=/usr/local/go" >> ~/.bashrc
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=$HOME/bin:/usr/local/go/bin:$PATH" >> ~/.bashrc

