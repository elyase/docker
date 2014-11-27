docker-staticpython
============

Probably the smallest docker image for python.

The total image size is **8.5 MB**. This is achieved by using busybox
 as the base image and the super small [StaticPython](https://code.google.com/p/pts-mini-gpl/wiki/StaticPython).

### Usage:

```bash
$ docker run -t -i --rm elyase/staticpython python
Python 2.7.1 (r271:86832, Oct 30 2011, 11:44:49) 
[GCC 4.1.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> 
```

For a new image create a `Dockerfile` in your Python app project:

```
FROM elyase/staticpython
CMD [ "python", "./your-daemon-or-script.py" ]
```

### FAQ:

**Why?:**

The official docker python image is too big (**900 MB**), the smallest python docker images run at several hundred MBs. The reason for that is that a typical Ubuntu base image is more than 200MB in size plus ~100Mb for a basic python installation.

**When is this useful?:**

You have a small pure python script that you want to test/run in an isolated docker container.

**Which python version is installed in the container?:**

2.7.2

**What are the drawbacks?:**

Please refer to [StaticPython's](https://code.google.com/p/pts-mini-gpl/wiki/StaticPython) main page. Esentially: no dependencies, no .so files, and no GUI.

[@elyase](http://yasermartinez.com/blog/)