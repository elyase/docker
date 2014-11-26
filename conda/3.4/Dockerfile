# Minimal python container
# based on [progrium/busybox](https://github.com/progrium/busybox) and [Anaconda Python Distribution](https://store.continuum.io/cshop/anaconda/)

FROM progrium/busybox
MAINTAINER Yaser Martinez Palenzuela
RUN opkg-install bash bzip2
ADD conda_install.sh /root/conda_install.sh
#ADD Miniconda3-3.7.3-Linux-x86_64.sh /root/miniconda3/Miniconda3-3.7.3-Linux-x86_64.sh
RUN ["bash", "/root/conda_install.sh"]
ENV PATH /root/miniconda3/bin:$PATH