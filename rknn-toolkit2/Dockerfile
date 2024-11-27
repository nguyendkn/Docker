# Sử dụng base image Ubuntu cho ARM64 từ arm64v8
FROM arm64v8/ubuntu:latest

# Thiết lập các biến môi trường cần thiết
ENV DEBIAN_FRONTEND=noninteractive

# Thêm thông tin người bảo trì
LABEL maintainer="nguyendkn.on@gmail.com"

# Cập nhật và cài đặt các gói cần thiết
RUN apt update && \
    apt install -y --no-install-recommends software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt install -y python3.12 python3.12-dev python3.12-distutils python3-pip gcc vim libprotobuf-dev zlib1g zlib1g-dev libsm6 libgl1 libglib2.0-0 android-tools-adb && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    ln -s /usr/bin/python3.12 /usr/bin/python3 && \
    ln -s /usr/bin/python3.12 /usr/bin/python

# Sao chép gói rknn_toolkit2 vào container
COPY rknn-toolkit2/rknn_toolkit2-2.3.0-cp312-cp312-manylinux_2_17_aarch64.manylinux2014_aarch64.whl /root/

# Cài đặt gói rknn_toolkit2
RUN pip3 install /root/rknn_toolkit2-2.3.0-cp312-cp312-manylinux_2_17_aarch64.manylinux2014_aarch64.whl

# Sao chép và cài đặt các yêu cầu bổ sung
COPY rknn-toolkit2/requirements.txt /root/
RUN pip3 install -r /root/requirements.txt

# Xóa bỏ liên kết tạm
RUN rm /usr/bin/python3 /usr/bin/python
