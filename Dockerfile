FROM tkelman/julia-llvm33
MAINTAINER Tony Kelman <tony@kelman.net>

RUN cd /home/julia-i686 && make -j2 -C deps && \
    cd /home/julia-x86_64 && make -j2 -C deps
