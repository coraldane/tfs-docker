#!/bin/bash


cd /mnt
#tar -zxvf tfs-release-2.2.0.tar.gz && rm -rf tfs-release-2.2.0.tar.gz

echo export TBLIB_ROOT=/opt/tblib >> /root/.bash_profile
source /root/.bash_profile


cd /mnt/tfs-release-2.2.0
sh build.sh init
#./configure --prefix=/usr/local/tfs --with-release --without-tcmalloc
./configure --prefix=/usr/local/tfs --with-release
make && make install

cp -r /mnt/tfs-release-2.2.0/conf/*.conf /usr/local/tfs/conf/
