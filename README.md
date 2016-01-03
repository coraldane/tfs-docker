# tfs-docker
This is a project to build tfs binary package in docker

## base
这个目录用于构建TFS的依赖镜像，包括tb-common-utils

## centos5
基于Centos 5 编译TFS，不依赖于base镜像，编译后的tfs 版本为2.2.0
由于淘宝内部使用的TFS 都运行在RHEL 5的机器上，GCC版本为4.1.2
源码SVN 地址为：http://code.taobao.org/svn/tfs/branches/dev_for_outer_users
注：code.taobao.org 地址已经关闭，不再提供下载

## centos7
基于 base 镜像构建，编译的源码为 https://github.com/alibaba/tfs的最新版本，
因为 github上的代码不能在CentOS 7 上的GCC 4.8.5编译通过，修改了三处代码。
请使用tfs-latest.tar.gz 这个压缩包。
