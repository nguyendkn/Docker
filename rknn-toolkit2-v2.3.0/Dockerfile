# Use Ubuntu for ARM64 as the base image from the official arm64v8 images
FROM arm64v8/ubuntu:latest

# Set non-interactive mode to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Maintainer label for image metadata
LABEL maintainer="nguyendkn.on@gmail.com"

# Reduce the number of layers and install only necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apt-utils \
    build-essential \
    cmake \
    libprotobuf-dev \
    protobuf-compiler \
    python3.12 \
    python3.12-dev \
    python3.12-venv \
    python3-pip \
    gcc \
    g++ && \
    rm -rf /var/lib/apt/lists/*

# Create a virtual environment to isolate Python dependencies
RUN python3.12 -m venv /opt/venv

# Set environment variables to use the virtual environment
ENV PATH="/opt/venv/bin:$PATH"

# Upgrade pip, setuptools, and wheel to the latest version
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# Add and install the rknn-toolkit2 wheel
COPY rknn_toolkit2-2.3.0-cp312-cp312-manylinux_2_17_aarch64.manylinux2014_aarch64.whl /root/
RUN pip install --no-cache-dir /root/rknn_toolkit2-2.3.0-cp312-cp312-manylinux_2_17_aarch64.manylinux2014_aarch64.whl && \
    rm /root/rknn_toolkit2-2.3.0-cp312-cp312-manylinux_2_17_aarch64.manylinux2014_aarch64.whl

# Add requirements and install Python dependencies
COPY requirements.txt /root/
RUN pip install --no-cache-dir -r /root/requirements.txt && \
    rm /root/requirements.txt

# Set the default command to keep the container running
CMD ["python3"]
