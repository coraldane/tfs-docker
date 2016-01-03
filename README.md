# tfs-docker
This is a project to build tfs binary package in docker   
使用Docker的方式编译Taobao File System    
如何使用Docker，请参考: https://www.docker.com/

众所周知，淘宝TFS 的编译环境很难搭建，由于官方的运行环境是GCC 4.1.2版本的RHEL 5   
笔者通过一段时间反复尝试，终于成功通过Docker的方式编译TFS且完成部署。  
TFS建议在64位Linux环境下运行，32位环境暂未部署成功。   


## centos5
由于淘宝内部使用的TFS 都运行在RHEL 5的机器上，GCC版本为4.1.2   
该版本基于Centos 5 编译TFS，不依赖于base镜像，编译后的tfs 版本为2.2.0   

源码SVN 地址为：http://code.taobao.org/svn/tfs/branches/dev_for_outer_users   
注：code.taobao.org 地址已经关闭，不再提供下载   

使用方式, 构建tfs:2.2.0的Docker镜像    
```
cd centos5 && sh build.sh
```
构建成功后会出现tfs:2.2.0的Docker镜像    

## base
这个目录用于构建TFS的依赖镜像，包括tb-common-utils   

使用方式，构建tfs/base镜像   
```
cd base && sh build.sh
```
构建成功后会出现tfs/base:1.0的Docker镜像

## centos7
基于 base 镜像构建，编译的源码为 https://github.com/alibaba/tfs 的最新版本，   
因为 github上的代码不能在CentOS 7 上的GCC 4.8.5编译通过，修改了三处代码。   
请使用tfs-latest.tar.gz 这个压缩包。   

使用方式, 构建tfs:latest的Docker镜像   
```
cd centos7 && sh build.sh
```
构建成功后会出现tfs:latest的Docker镜像   

## releases
默认提供一个编译好的二进制包：
https://github.com/coraldane/tfs-docker/releases/download/2.2.16/tfs-centos7-amd64.tar.gz   
在CentOS 7环境下成功运行    
启动过程中如果出现缺少依赖包的情况，请自行安装     
笔者将这个二进制包复制到新机器上运行，需要安装以下几个依赖：   
yum -y install gperftools-devel.x86_64 readline-devel   
