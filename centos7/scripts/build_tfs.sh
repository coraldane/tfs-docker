#!/bin/bash


cd /mnt
#tar -zxvf tfs-release-2.2.0.tar.gz && rm -rf tfs-release-2.2.0.tar.gz

echo export TBLIB_ROOT=/opt/tblib >> /root/.bash_profile
source /root/.bash_profile


cd /mnt/tfs-latest
sh build.sh init
./configure --prefix=/usr/local/tfs --with-release
make && make install

mkdir /usr/local/tfs/conf
cp -r /mnt/tfs-latest/conf/*.conf /usr/local/tfs/conf/
