#!/bin/bash

cd /mnt
tar -zxvf tb-common-utils.tar.gz && rm -rf tb-common-utils.tar.gz
tar -zxvf jemalloc-4.0.4.tar.gz && rm -rf jemalloc-4.0.4.tar.gz


cd /mnt/jemalloc-4.0.4
./configure && make && make install


echo export TBLIB_ROOT=/opt/tblib >> /root/.bash_profile
source /root/.bash_profile


cd /mnt/tb-common-utils
sh build.sh
