FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="nguyendkn.on@gmail.com"

RUN apt update && \
    apt install -y --no-install-recommends python3 python-is-python3 && \
    apt install -y --no-install-recommends python3-dev python3-pip gcc vim libprotobuf-dev zlib1g zlib1g-dev libsm6 && \
    apt install -y --no-install-recommends libgl1 libglib2.0-0 android-tools-adb

COPY rk3588_onnx2rknn/rknn_toolkit-1.7.5-cp35-cp35m-linux_aarch64.whl rknn_toolkit-1.7.5-cp35-cp35m-linux_aarch64.whl

RUN pip3 install rknn_toolkit-1.7.5-cp35-cp35m-linux_aarch64.whl

COPY rk3588_onnx2rknn/requirements.txt requirements.txt

RUN pip3 install -r requirements.txt