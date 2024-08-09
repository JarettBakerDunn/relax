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
    autoconf \
    automake \
    autoconf-archive \
    libpython2.7-dev \
    libpython2.7 \
    python2.7 \
    gnulib \
    sudo \
    libmkl-dev 

RUN useradd \
--create-home \
relax_user && echo "relax_user:password" | chpasswd

RUN sudo adduser relax_user sudo

RUN ln -s /usr/bin/python2.7 /usr/bin/python;

USER relax_user

WORKDIR /home/relax_user

RUN git clone 'https://github.com/geodynamics/relax'; 
RUN curl -L -O https://github.com/GenericMappingTools/gmt/releases/download/4.5.18/gmt-4.5.18-src.tar.bz2;
RUN curl -L -O https://src.rrz.uni-hamburg.de/object/ead16cb3b671f767396387dcb3c1a814-11097157-1466798847/netcdf-4.1.3.tar.gz;
RUN curl -L -O https://download.osgeo.org/proj/proj-4.8.0.tar.gz;

USER root
RUN tar -xvf netcdf-4.1.3.tar.gz; cd netcdf-4.1.3; ./configure --disable-dap --disable-netcdf-4; make; make install;

RUN tar -xvf gmt-4.5.18-src.tar.bz2; cd gmt-4.5.18; ./configure; make; make install-gmt;

RUN tar -xvf proj-4.8.0.tar.gz ; cd proj-4.8.0; ./configure; make; make install;
USER relax_user
ENV PATH="/home/relax_user/netcdf-4.1.3/f90:${PATH}"

RUN curl -L -O https://registrationcenter-download.intel.com/akdlm/IRC_NAS/801143de-6c01-4181-9911-57e00fe40181/l_fortran-compiler_p_2024.2.0.426_offline.sh;


RUN cd relax; echo "password" | sudo -S ./waf configure --netcdf-incdir=/usr/local/include --netcdf-libdir=/usr/local/lib --mkl-incdir=/usr/include/mkl --mkl-libdir=/usr/lib/x86_64-linux-gnu --openmp-flag=-fopenmp
