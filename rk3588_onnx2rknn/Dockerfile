FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="nguyendkn.on@gmail.com"

RUN apt update && \
    apt install -y --no-install-recommends python3 python-is-python3 python3-dev python3-pip gcc vim libprotobuf-dev zlib1g zlib1g-dev libsm6 libgl1 libglib2.0-0 android-tools-adb && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY rk3588_onnx2rknn/rknn_toolkit2-2.0.0b12+1fc94019-cp310-cp310-linux_x86_64.whl /root/rknn_toolkit2-2.0.0b12+1fc94019-cp310-cp310-linux_x86_64.whl

RUN pip3 install /root/rknn_toolkit2-2.0.0b12+1fc94019-cp310-cp310-linux_x86_64.whl

COPY rk3588_onnx2rknn/requirements.txt requirements.txt

RUN pip3 install -r requirements.txt