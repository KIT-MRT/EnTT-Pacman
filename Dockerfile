FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      cmake \
      libsdl2-dev

RUN mkdir -p /opt/pacman && chown 1000:1000 /opt/pacman

COPY animations /opt/pacman/animations
COPY cmake /opt/pacman/cmake
COPY src /opt/pacman/src
COPY third_party /opt/pacman/third_party
COPY CMakeLists.txt /opt/pacman/CMakeLists.txt

RUN mkdir -p /opt/pacman/build && \
    chdir /opt/pacman/build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . && \
    cmake --install . && \
    rm -rf /opt/pacman && \
    ldconfig

RUN useradd --create-home --uid 1000 blinky
USER blinky

WORKDIR /home/blinky

CMD [ "pacman" ]