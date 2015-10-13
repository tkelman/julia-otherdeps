FROM tkelman/julia-openblas
MAINTAINER Tony Kelman <tony@kelman.net>

RUN dpkg --add-architecture i386 && apt-get update && \
    apt-get install -y --no-install-recommends m4 cmake \
        libssl-dev libssl-dev:i386 && \
    cd /home/julia32 && make -j4 -C deps && \
    cd /home/julia64 && make -j4 -C deps
