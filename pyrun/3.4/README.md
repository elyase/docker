docker-pyrun
============

A small (the smallest?) docker image for python.

The total image size is **20.35 MB**. This is achieved by using the great [progrium/busybox](https://github.com/progrium/busybox)
 as base image and the super small [Egenix PyRun](https://www.egenix.com/products/python/PyRun/).

### Usage:

```bash
$ docker run -t -i --rm elyase/pyrun:3.4 python
eGenix PyRun 3.4.1 (release 2.0.1, default, Aug 26 2014, 11:51:10)
[GCC 4.6.4]
Thank you for using eGenix PyRun. Type "help" or "license" for details.

>>>
```

For a new image create a `Dockerfile` in your Python app project:

```
FROM elyase/pyrun:2.7
CMD [ "python", "./your-daemon-or-script.py" ]
```

### FAQ:

**Why?:**

The official docker python image is too big (**900 MB**), the smallest python docker image runs at several hundred MBs. The reason for that is that a typical Ubuntu base image is more than 200MB in size plus ~100Mb for a basic python installation.

**When is this useful?:**

You have a small pure python script that you want to test/run in an isolated docker container.

**Which python version is installed in the container?:**

There are two image tags, one for python 2.7 and one for python 3.4. Ex:

```bash
$ docker pull elyase/pyrun:3.4
```

**What are the drawbacks?:**

Please refer to [PyRun's](https://www.egenix.com/products/python/PyRun/) page. Esentially: it is somewhat difficult to install dependencies and some less used modules are missing like `readline`, `tkinter`, `multiprocessing`, etc. In general everything should run like in a standard python distribution.

**Can I install packages?**

No, but I am planning on also making a pip compatible image.

### Credits

[@elyase](http://yasermartinez.com/blog/)