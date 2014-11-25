FROM progrium/busybox
MAINTAINER Yaser Martinez Palenzuela <@elyase>
RUN opkg-install bzip2 libsqlite3 libpthread zlib libopenssl
ADD pyrun3.4 /bin/python
RUN ln -s /usr/lib/libbz2.so.1.0 /usr/lib/libbz2.so.1
RUN ln -sf /lib/libpthread-2.18.so /lib/libpthread.so.0