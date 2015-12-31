#!/bin/bash

echo export TBLIB_ROOT=/opt/tblib >> /root/.bash_profile
source /root/.bash_profile

cd /mnt/tb-common-utils
sh build.sh

cd /mnt/tfs-release-2.2.0
sh build.sh init
#./configure --prefix=/opt/tfs --with-release --without-tcmalloc
./configure --prefix=/root/tfs_bin --with-release

make && make install

cp -r /mnt/tfs-release-2.2.0/conf/*.conf /root/tfs_bin/conf/
