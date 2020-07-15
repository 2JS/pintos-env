# pintos-env

**pintos-env** provides pintos build/test environment with docker image, including QEMU 2.5.0, GCC 7.5.0, Ubuntu 16.04, for students who want or need to run pintos on their local machine. Building and testing pintos on local machine will save you from repeated uploading source code and long compile/run time.

This docker image is based on Ubuntu 16.04 Xenial, includes QEMU 2.5.0 and GCC 7.5.0, which are minimal requirement for pintos to run.

## Tags

* `latest`, `xenial`

## Getting started

### For macOS/Linux

1. Open `Terminal.app`
2. Go to your pintos project directory that directly includes `threads` directory.
3. `./run.sh`

### For Windows

1. Open terminal such as `PowerShell` or `git bash`
2. Go to your pintos project directory that directly includes `threads` directory.
3. `./run.sh`

**Note**: Not properly tested on windows. Please create issue if there is any trouble.

## No Guarantee

Even though this image imitates most of actual build environment, tests may pass but it does not guarantee that it will be on server. Before final submission, be sure to test it on server more than once.

## Issue Reporting

Whenever any relevant trouble occurs, or any improvement idea comes into your mind, feel free to [report issue](https://github.com/2JS/pintos-env/issues/new/choose).

## Simple irrelevant Tip

You may use `-j` option within `make` to enable parallel compiling.

Use `make -j`, or `make -j8` for 8 parallel compiler threads. You can get more than 4X faster compile time.

> ```
> $ time make
> ...
> real	0m43.633s
> user	0m5.072s
> sys	0m5.580s
> ```
>
> ```
> $ time make -j
> ...
> real	0m10.401s
> user	0m8.927s
> sys	0m12.912s
> ```
>
> Project 3 VM Build, Tested on Mac Pro 2013, 3.5 GHz 6-Core "Ivy Bridge-EP" Intel Xeon (E5-1650 v2) with 12 MB L3 cache, 16 GB DDR3 ECC at 1866 MHz

Same option can be applied to `make check`. However, running too many qemus may harm performance and cause memory shortage, therefore use `-j6`~`-j12` is appropriate.

## Future improvements

1. Alpine linux image less than 100MB
2. Bochs
3. GCC 7.4.0. There is no reported trouble with GCC 7.5.0 yet, but standard compiler is GCC 7.4.0.
