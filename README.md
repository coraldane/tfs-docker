# tfs-docker
This is a project to build tfs binary package in docker
使用Docker的方式编译Taobao File System

众所周知，淘宝TFS 的编译环境很难搭建，由于官方使用的是GCC 4.1.2版本的RHEL 5下搭建运行   
笔者通过一段时间使用Docker，发现非常适合于在此基础上搭建TFS的编译环境。  
TFS建议在64位Linux环境下运行，32位环境暂未部署成功。   

## base
这个目录用于构建TFS的依赖镜像，包括tb-common-utils   

## centos5
基于Centos 5 编译TFS，不依赖于base镜像，编译后的tfs 版本为2.2.0   
由于淘宝内部使用的TFS 都运行在RHEL 5的机器上，GCC版本为4.1.2   
源码SVN 地址为：http://code.taobao.org/svn/tfs/branches/dev_for_outer_users   
注：code.taobao.org 地址已经关闭，不再提供下载   

## centos7
基于 base 镜像构建，编译的源码为 https://github.com/alibaba/tfs 的最新版本，   
因为 github上的代码不能在CentOS 7 上的GCC 4.8.5编译通过，修改了三处代码。   
请使用tfs-latest.tar.gz 这个压缩包。   

本目录下默认提供一个编译好的二进制包：tfs-centos7-amd64.tar.gz   
在CentOS 7环境下成功运行    
启动过程中如果出现缺少依赖包的情况，请自行安装     
笔者将这个二进制包复制到新机器上运行，需要安装以下几个依赖：   
yum -y install gperftools-devel.x86_64 readline-devel   
