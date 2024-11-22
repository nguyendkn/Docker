#!/bin/sh

# Kiểm tra xem user và password đã được truyền vào chưa
if [ -n "$MQTT_USER" ] && [ -n "$MQTT_PASSWORD" ]; then
    echo "Creating Mosquitto password file..."

    # Kiểm tra nếu file passwd tồn tại trước khi tạo
    if [ -f /mosquitto/config/passwd ]; then
        echo "Password file exists, overwriting..."
    else
        echo "Password file does not exist, creating a new one..."
    fi

    # Tạo file mật khẩu
    mosquitto_passwd -b -c /mosquitto/config/passwd "$MQTT_USER" "$MQTT_PASSWORD"

    # Kiểm tra lỗi sau khi tạo
    if [ $? -eq 0 ]; then
        echo "Password file created successfully."
    else
        echo "Error creating password file."
        exit 1
    fi
else
    echo "MQTT_USER or MQTT_PASSWORD not provided. Using existing passwd file."
fi
