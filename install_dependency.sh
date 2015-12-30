#!/bin/bash

cd /etc/yum.repos.d/
rm -rf *
cat /mnt/CentOS.repo > /etc/yum.repos.d/CentOS.repo

yum -y install make automake autoconf file
yum -y install gcc-c++
yum -y install e2fsprogs-devel.x86_64
yum -y install google-perftools
yum -y install libtool
yum -y install zlib-devel
yum -y install readline-devel
yum -y install ncurses.x86_64
yum -y install ncurses-devel.x86_64
yum -y install mysql.x86_64 mysql-devel.x86_64


cd /mnt
tar -zxvf libunwind-1.1.tar.gz && rm -rf libunwind-1.1.tar.gz
tar -zxvf gperftools-2.4.tar.gz && rm -rf gperftools-2.4.tar.gz
tar -zxvf tb-common-utils.tar.gz && rm -rf tb-common-utils.tar.gz
tar -zxvf tfs-release-2.2.0.tar.gz && rm -rf tfs-release-2.2.0.tar.gz

cd /mnt/libunwind-1.1
./configure && make && make install


cd /mnt/gperftools-2.4
./configure && make && make install

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
