FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="nguyendkn.on@gmail.com"

# Cập nhật và cài đặt các công cụ cần thiết
RUN apt update && \
    apt install -y build-essential zlib1g-dev libncurses5-dev \
        libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev curl libbz2-dev \
        gcc vim libprotobuf-dev zlib1g zlib1g-dev libsm6 libgl1 libglib2.0-0 android-tools-adb && \
    apt-get clean

# Biên dịch Python 3.5
ADD https://www.python.org/ftp/python/3.5.10/Python-3.5.10.tgz /tmp/Python-3.5.10.tgz
RUN cd /tmp && \
    tar xzf Python-3.5.10.tgz && \
    cd Python-3.5.10 && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall && \
    cd .. && rm -rf Python-3.5.10*

# Cập nhật `pip` và sửa lỗi SSL
RUN python3.5 -m ensurepip && \
    python3.5 -m pip install --upgrade pip==20.3.4 && \
    python3.5 -m pip install certifi && \
    ln -sf /usr/local/lib/python3.5/site-packages/certifi/cacert.pem /etc/ssl/certs/ca-certificates.crt

# Copy file RKNN Toolkit và các thư viện cần thiết
COPY rk3588_onnx2rknn_aarch64_p35/rknn_toolkit-1.7.5-cp35-cp35m-linux_aarch64.whl /root/
COPY rk3588_onnx2rknn_aarch64_p35/requirements.txt /root/

# Cài đặt RKNN Toolkit và các gói Python
RUN python3.5 -m pip install /root/rknn_toolkit-1.7.5-cp35-cp35m-linux_aarch64.whl && \
    python3.5 -m pip install -r /root/requirements.txt

# Xóa file không cần thiết
RUN rm -f /root/rknn_toolkit-1.7.5-cp35-cp35m-linux_aarch64.whl /root/requirements.txt

# Đặt thư mục làm việc
WORKDIR /workspace

# Mở shell
CMD ["bash"]
