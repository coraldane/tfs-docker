#!/bin/bash

cd /etc/yum.repos.d/
rm -rf CentOS*
mv /mnt/CentOS.repo /etc/yum.repos.d/

rpm -ivh /mnt/epel-release-6-8.noarch.rpm

yum -y install make automake autoconf file tar
yum -y install gcc gcc-c++
yum -y install e2fsprogs-devel.x86_64
yum -y install libtool
yum -y install zlib-devel.x86_64
yum -y install readline-devel
yum -y install ncurses.x86_64
yum -y install ncurses-devel.x86_64
yum -y install libunwind-devel
yum -y install gperftools
yum -y install mysql.x86_64 mysql-devel.x86_64


cd /mnt
tar -zxvf tb-common-utils.tar.gz && rm -rf tb-common-utils.tar.gz
tar -zxvf tfs-release-2.2.16.tar.gz && rm -rf tfs-release-2.2.16.tar.gz

echo export TBLIB_ROOT=/opt/tblib >> /root/.bash_profile
source /root/.bash_profile

cd /mnt/tb-common-utils
sh build.sh

cd /mnt/tfs-release-2.2.16
sh build.sh init
#./configure --prefix=/opt/tfs --with-release --without-tcmalloc
./configure --prefix=/root/tfs_bin --with-release

make && make install
