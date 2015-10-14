FROM tkelman/julia-llvm33
MAINTAINER Tony Kelman <tony@kelman.net>

RUN for ARCH in i686 x86_64; do \
      DEPS="libuv openlibm openspecfun utf8proc libgit2 pcre \
            dsfmt Rmath-julia arpack fftw suitesparse unwind \
            gmp mpfr patchelf virualenv"; \
      for dep in $DEPS; do \
        cd /home/julia-$ARCH && make -j2 -C deps install-$dep; \
      done && \
      for dep in $DEPS; do \
        cd /home/julia-$ARCH && make -j2 -C deps distclean-$dep; \
      done \
    done
# distclean should leave in place the installed libraries and headers
