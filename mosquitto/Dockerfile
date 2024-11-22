# Sử dụng image chính thức của Mosquitto
FROM eclipse-mosquitto:latest

# Tạo các thư mục cần thiết và đảm bảo quyền ghi
RUN mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && \
    touch /mosquitto/config/passwd && \
    chmod -R 777 /mosquitto

# Sao chép file cấu hình Mosquitto vào container
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Sao chép script tạo file password vào container
COPY create_passwd.sh /usr/local/bin/create_passwd.sh
RUN chmod +x /usr/local/bin/create_passwd.sh

# CMD để tạo file passwd và khởi động Mosquitto
CMD ["/bin/sh", "-c", "/usr/local/bin/create_passwd.sh && mosquitto -c /mosquitto/config/mosquitto.conf"]
