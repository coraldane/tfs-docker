FROM centos:7
MAINTAINER coraldane coraldane@163.com

COPY scripts /root/
COPY tars /mnt/

RUN bash /root/install_libs.sh
RUN bash /root/build_tb_util.sh


CMD /bin/bash
