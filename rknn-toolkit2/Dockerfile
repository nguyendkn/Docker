FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="nguyendkn.on@gmail.com"

RUN apt update && \
    apt install -y --no-install-recommends python3 python-is-python3 python3-dev python3-pip gcc vim libprotobuf-dev zlib1g zlib1g-dev libsm6 libgl1 libglib2.0-0 android-tools-adb && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY rknn-toolkit2/rknn_toolkit2-2.3.0-cp312-cp312-manylinux_2_17_aarch64.manylinux2014_aarch64.whl /root/rknn_toolkit2-2.3.0-cp312-cp312-manylinux_2_17_aarch64.manylinux2014_aarch64.whl

RUN pip3 install /root/rknn_toolkit2-2.3.0-cp312-cp312-manylinux_2_17_aarch64.manylinux2014_aarch64.whl

COPY rknn-toolkit2/requirements.txt requirements.txt

RUN pip3 install -r requirements.txt