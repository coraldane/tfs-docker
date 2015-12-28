FROM centos:6
MAINTAINER coraldane coraldane@163.com

COPY tars /mnt/
COPY install_dependency.sh /root/install_dependency.sh

RUN bash /root/install_dependency.sh

CMD /bin/bash
