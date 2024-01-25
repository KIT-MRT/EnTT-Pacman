FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      cmake \
      libsdl2-dev

RUN mkdir -p /opt/pacman && chown 1000:1000 /opt/pacman

RUN useradd --create-home --uid 1000 blinky
USER blinky

COPY animations /opt/pacman/animations
COPY cmake /opt/pacman/cmake
COPY src /opt/pacman/src
COPY third_party /opt/pacman/third_party
COPY CMakeLists.txt /opt/pacman/CMakeLists.txt

WORKDIR /opt/pacman/build
RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN cmake --build .

CMD [ "./pacman" ]