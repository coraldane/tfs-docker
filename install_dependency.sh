#!/bin/bash

cd /etc/yum.repos.d/
rm -rf CentOS*
mv /mnt/*.repo /etc/yum.repos.d/

yum -y install make automake autoconf file
yum -y install libuuid-devel
yum -y install tar
yum -y install gcc gcc-c++
yum -y install e2fsprogs-devel.x86_64
yum -y install libtool
yum -y install zlib-devel.x86_64
yum -y install readline-devel
yum -y install ncurses.x86_64
yum -y install ncurses-devel.x86_64
yum -y install mysql.x86_64 mysql-devel.x86_64

yum -y install libunwind-devel
yum -y install gperftools


echo export TBLIB_ROOT=/opt/tblib >> /root/.bash_profile
source /root/.bash_profile

cd /mnt/tb-common-utils
sh build.sh

cd /mnt/tfs-release-2.2.16
sh build.sh init
#./configure --prefix=/opt/tfs --with-release --without-tcmalloc
./configure --prefix=/root/tfs_bin --with-release --with-gnu-ld CFLAGS=-fpermissive CPPFLAGS=-fpermissive

make && make install
