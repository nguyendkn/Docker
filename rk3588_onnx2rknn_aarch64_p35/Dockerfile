# Sử dụng Ubuntu 20.04 làm nền tảng
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="nguyendkn.on@gmail.com"

# Cài đặt các gói cần thiết để biên dịch Python 3.5
RUN apt update && apt install -y \
    build-essential zlib1g-dev libncurses5-dev libgdbm-dev \
    libnss3-dev libssl-dev libreadline-dev libffi-dev curl \
    libbz2-dev gcc vim libprotobuf-dev zlib1g zlib1g-dev libsm6 \
    libgl1 libglib2.0-0 android-tools-adb && \
    apt-get clean

# Tải mã nguồn Python 3.5 riêng biệt để tận dụng cache
ADD https://www.python.org/ftp/python/3.5.10/Python-3.5.10.tgz /tmp/Python-3.5.10.tgz

# Biên dịch và cài đặt Python 3.5
RUN cd /tmp && \
    tar xzf Python-3.5.10.tgz && \
    cd Python-3.5.10 && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall && \
    cd .. && rm -rf Python-3.5.10*

# Copy file RKNN Toolkit và các thư viện cần thiết
COPY rk3588_onnx2rknn_aarch64/rknn_toolkit-1.7.5-cp35-cp35m-linux_aarch64.whl /root/
COPY rk3588_onnx2rknn_aarch64/requirements.txt /root/

# Cài đặt RKNN Toolkit và các thư viện Python
RUN python3.5 -m pip install --upgrade pip && \
    python3.5 -m pip install /root/rknn_toolkit-1.7.5-cp35-cp35m-linux_aarch64.whl && \
    python3.5 -m pip install -r /root/requirements.txt

# Xóa file không cần thiết để giảm kích thước image
RUN rm -f /root/rknn_toolkit-1.7.5-cp35-cp35m-linux_aarch64.whl /root/requirements.txt

# Đặt thư mục làm việc
WORKDIR /workspace

# Mở shell để bắt đầu làm việc
CMD ["bash"]
