FROM centos:7
MAINTAINER coraldane coraldane@163.com

COPY tars /mnt/
COPY scripts /root/

RUN bash /root/install_dependency.sh
RUN bash /root/install_tfs.sh


CMD /bin/bash
