# Minimal python container
# based on [progrium/busybox](https://github.com/progrium/busybox) and [Anaconda Python Distribution](https://store.continuum.io/cshop/anaconda/)

FROM progrium/busybox
MAINTAINER Yaser Martinez Palenzuela
RUN opkg-install bash bzip2 zlib
ADD conda_install.sh /root/conda_install.sh
RUN ["bash", "/root/conda_install.sh"]
ENV PATH /root/miniconda/bin:$PATH
