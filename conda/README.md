elyase/conda
============

A minimal python docker image based on [progrium/busybox](https://github.com/progrium/busybox) and the [Anaconda Python Distribution](https://store.continuum.io/cshop/anaconda/)

The total weight of this image is **88.97**. For comparison a `ubuntu:14.04` base image (without python) is 195 MB in size and typical python distribution needs aproximately another 100 MBs. When you add the compilation toolchain and dependencies you get the official python docker image, which is close to 900MB in size.

The intended use of this recipe is to serve as base image for scientific stack (numpy, pandas, ipython, sklearn) applications where the conda packaging system shines. For an even smaller image see [`elyase/pyrun`](https://registry.hub.docker.com/u/elyase/pyrun/) (**18.44 MB**) or [`elyase/staticpython`](https://registry.hub.docker.com/u/elyase/staticpython/)
(**8.5 MB**).

### So what is missing?

Nothing of importance should be missing. In order to reduce the size I used a really small base image ([progrium/busybox](https://github.com/progrium/busybox)), cleaned conda cache files, deleted python `.pyc` files (this should be automatically regenerated but depending on your use case this could affect performance) and the tests folders (unittest is still there).

### Credits

[@elyase](http://yasermartinez.com)

