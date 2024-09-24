FROM ubuntu:jammy

RUN apt-get update && \
  DEBIAN_FRONTEND='noninteractive' \
  DEBCONF_NONINTERACTIVE_SEEN='true' \
  apt-get install --yes \
    gfortran \
    build-essential \
    git \
    curl \
    libnetcdf-dev \
    libnetcdff-dev \
    autoconf \
    automake \
    gmt \
    gmt-gshhg \
    autoconf-archive \
    python-is-python3 \
    gnulib \
    sudo \
    proj-bin \
    libmkl-full-dev \
    software-properties-common

RUN apt-get install nano

RUN curl -L -O https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
RUN apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
RUN rm GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
RUN add-apt-repository "deb https://apt.repos.intel.com/oneapi all main"
RUN apt install --yes intel-hpckit
RUN cd /opt/intel/oneapi; chmod +x setvars.sh; 



RUN useradd \
--create-home \
relax_user && echo "relax_user:password" | chpasswd

RUN sudo adduser relax_user sudo

USER relax_user

CMD cd /opt/intel/oneapi/; . ./setvars.sh; /bin/bash

WORKDIR /home/relax_user

RUN git clone 'https://github.com/geodynamics/relax.git';

#RUN cd relax; ./waf configure --netcdf-dir=/usr --netcdf-libdir=/usr/lib/x86_64-linux-gnu/ --mkl-dir=/usr --mkl-incdir=/usr/include/mkl --mkl-libdir=/usr/lib/x86_64-linux-gnu/ --openmp-flag="-fopenmp"