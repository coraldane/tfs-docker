#!/bin/bash


cd /mnt
tar -zxvf tb-common-utils.tar.gz && rm -rf tb-common-utils.tar.gz
#tar -zxvf tfs-release-2.2.0.tar.gz && rm -rf tfs-release-2.2.0.tar.gz
tar -zxvf jemalloc-4.0.4.tar.gz && rm -rf jemalloc-4.0.4.tar.gz

cd /mnt/jemalloc-4.0.4
./configure && make && make install


echo export TBLIB_ROOT=/opt/tblib >> /root/.bash_profile
source /root/.bash_profile


cd /mnt/tb-common-utils
sh build.sh

cd /mnt/tfs-release-2.2.16
sh build.sh init
./configure --prefix=/opt/tfs --with-release --without-tcmalloc

make && make install

cp -r /mnt/tfs-release-2.2.0/conf/*.conf /root/tfs_bin/conf/
