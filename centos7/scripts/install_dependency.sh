#!/bin/bash

cd /etc/yum.repos.d/
rm -rf *
cat /mnt/CentOS.repo > /etc/yum.repos.d/CentOS.repo

yum -y install make automake autoconf file
yum -y install gcc-c++
yum -y install libuuid-devel
yum -y install e2fsprogs-devel.x86_64
yum -y install google-perftools
yum -y install libtool
yum -y install zlib-devel
yum -y install readline-devel
yum -y install ncurses.x86_64
yum -y install ncurses-devel.x86_64
yum -y install mysql.x86_64 mysql-devel.x86_64


cd /mnt
tar -zxvf tb-common-utils.tar.gz && rm -rf tb-common-utils.tar.gz
tar -zxvf tfs-release-2.2.0.tar.gz && rm -rf tfs-release-2.2.0.tar.gz
