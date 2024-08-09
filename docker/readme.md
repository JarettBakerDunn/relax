need:
- gfortran
- GMT 4.5 +netcdf
- Proj 4.7.1 ? what is this?
- Python 2.4
- a fast FFT library (FFTW or MKL)


Currently when running ./waf to build relax, the linker fails when it tries to find MKL even though configure finds MKL just fine. maybe setting the MKL options below will help.
for ./waf configure.

must set flags to all the right paths.
try intel fortran compiler OR try fttw, gfortran and mkl may not work that well together.

MKL Options:
    --mkl-dir=MKL_DIR   Base directory where mkl is installed
    --mkl-incdir=MKL_INCDIR
                        Directory where mkl include files are installed
    --mkl-libdir=MKL_LIBDIR
                        Directory where mkl library files are installed
    --mkl-libs=MKL_LIBS
                        Names of the mkl libraries without prefix or suffix (e.g. "mkl_intel_lp64 mkl_intel_thread mkl_core"


  NETCDF Options:
    --netcdf-dir=NETCDF_DIR
                        Base directory where NETCDF is installed
    --netcdf-incdir=NETCDF_INCDIR
                        Directory where NETCDF include files are installed
    --netcdf-libdir=NETCDF_LIBDIR
                        Directory where NETCDF library files are installed