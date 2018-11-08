#!/bin/bash -e

apt-get update 
pip install Pillow

cd /
git clone https://github.com/LouieYang/deep-photo-styletransfer-tf.git style-transfer
cd /style-transfer

rm -rf /var/lib/apt/lists/*

