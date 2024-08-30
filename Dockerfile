ARG APP_VERSION="0.0.0"

FROM debian:bookworm-slim

# NOTE: The dependencies and build steps come from:
#       https://wiki.qt.io/Cross-Compile_Qt_6_for_Raspberry_Pi

RUN apt-get update && apt-get -y --no-install-suggests install \
    #bison \
    build-essential \
    #clang \
    cmake \
    #freeglut3-dev \
    #g++-aarch64-linux-gnu \
    #gcc \
    #gcc-aarch64-linux-gnu \
    #git \
    #gperf \
    #libatspi2.0-dev \
    #libclang-dev \
    #libfontconfig1-dev \
    #libfreetype6-dev \
    #libgl1-mesa-dev \
    #libglu1-mesa-dev \
    #libx11-dev \
    #libx11-xcb-dev \
    #libxcb-glx0-dev \
    #libxcb-icccm4-dev \
    #libxcb-image0-dev \
    #libxcb-keysyms1-dev \
    #libxcb-randr0-dev \
    #libxcb-render-util0-dev \
    #libxcb-shape0-dev \
    #libxcb-shm0-dev \
    #libxcb-sync-dev \
    #libxcb-util-dev \
    #libxcb-xfixes0-dev \
    #libxcb-xinerama0-dev \
    #libxcb-xkb-dev \
    #libxcb1-dev \
    #libxext-dev \
    #libxfixes-dev \
    #libxi-dev \
    #libxkbcommon-dev \
    #libxkbcommon-x11-dev \
    #libxrender-dev \
    #make \
    #ninja-build \
    #pkg-config \
    #python3 \
    qt6-base-dev \
    && apt-get clean \
    && rm -r /var/lib/apt/lists /var/cache/apt

WORKDIR /src
COPY . /src

# NOTE: The following build command comes from the "General Messages
CMD cmake -DCMAKE_PREFIX_PATH:PATH=/usr/lib/x86_64-linux-gnu/cmake/Qt6 -DCMAKE_BUILD_TYPE=Debug -B build \
    #&& cd build \
    && cmake --build build
#CMD cmake \
#    -B build \
#    '-DCMAKE_GENERATOR:STRING=Unix Makefiles' \
#    -DCMAKE_BUILD_TYPE:STRING=Debug \
#    -DQT_QMAKE_EXECUTABLE:FILEPATH=/usr/lib/qt6/bin/qmake \
#    -DCMAKE_PREFIX_PATH:PATH=/usr/lib/x86_64-linux-gnu/cmake/Qt6 \
#    -DCMAKE_C_COMPILER:FILEPATH=/usr/bin/gcc \
#    -DCMAKE_CXX_COMPILER:FILEPATH=/usr/bin/g++ \
#    -DCMAKE_CXX_FLAGS_INIT:STRING=-DQT_QML_DEBUG

