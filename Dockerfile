FROM tkelman/julia-llvm33
MAINTAINER Tony Kelman <tony@kelman.net>

RUN for ARCH in i686 x86_64; do \
      cd /home/julia-$ARCH && make -j2 -C deps && \
      make -j2 -C deps distclean-libuv distclean-openlibm \
        distclean-openspecfun distclean-utf8proc distclean-libgit2 \
        distclean-pcre distclean-dsfmt distclean-Rmath-julia distclean-arpack \
        distclean-fftw distclean-suitesparse distclean-unwind distclean-gmp \
        distclean-mpfr distclean-patchelf distclean-virtualenv; \
    done
# distclean should leave in place the build libraries
