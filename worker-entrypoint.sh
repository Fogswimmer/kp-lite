#!/bin/bash
set -euo pipefail

echo "Starting Messenger Worker..."

mkdir -p var/log

chown -R www-data:www-data var

echo "Waiting for main application to be ready..."
sleep 15

echo "Checking RabbitMQ connection..."
timeout=60
counter=0
until php bin/console messenger:setup-transports 2>/dev/null || [ $counter -eq $timeout ]; do
    echo "Waiting for RabbitMQ... ($counter/$timeout)"
    sleep 2
    ((counter++))
done

if [ $counter -eq $timeout ]; then
    echo "RabbitMQ connection timeout"
    exit 1
fi

echo "RabbitMQ connection established"

cleanup() {
    echo "Shutting down worker gracefully..."
    exit 0
}

trap cleanup SIGTERM SIGINT

echo "Starting Messenger consumer..."
exec php bin/console messenger:consume async -vv \
    --time-limit=3600 \
    --memory-limit=128M \
    --failure-limit=3 \
    --env=prod