FROM golang:buster AS binacsGoBuild

RUN apt-get install -y git && \
	\
	go get github.com/xalanq/cf-tool && \
	cd src/github.com/xalanq/cf-tool && \
	go build -ldflags "-s -w" cf.go

FROM binacslee/novnc-base:baseimage-cn

COPY --from=binacsGoBuild /go/src/github.com/xalanq/cf-tool/cf /usr/sbin/cf

ENV PATH=/qt/5.15.0/gcc_64/bin:$PATH

RUN apt-get update && \
    apt-get install -y \
        firefox firefox-locale-zh-hans \
        wget git g++ cmake clang-format \
        mesa-common-dev libxcb* libxkbcommon-x11-dev && \
    \
    curl https://bootstrap.pypa.io/get-pip.py | python3 && \
    pip install aqtinstall yapf && \
    \
    mkdir /qt && cd /qt && \
    python3 -m aqt install 5.15.0 linux desktop && \
    \
    cd /tmp && \
    git clone --depth=1 --recurse-submodules https://github.com/cpeditor/cpeditor.git && \
    \
    cd cpeditor && \
    mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    cmake --build . && \
    \
    mv ./cpeditor /usr/sbin/cpeditor && \
    rm -rf /tmp/*

CMD firefox https://addons.mozilla.org/firefox/downloads/file/3716460/competitive_companion-2.19.7-fx.xpi
