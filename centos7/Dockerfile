FROM tfs/base:1.0
MAINTAINER coraldane coraldane@163.com

COPY tars /mnt/
COPY scripts/build_tfs.sh /root/build_tfs.sh

RUN bash /root/build_tfs.sh


CMD /bin/bash
