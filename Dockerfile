FROM centos:5
MAINTAINER coraldane coraldane@163.com

COPY install_dependency.sh /root/install_dependency.sh
COPY tars /mnt/

RUN bash /root/install_dependency.sh


CMD /bin/bash
