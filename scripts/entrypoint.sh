#!/bin/bash

init_zephyr_env() {

    if [ ! -f /workspace/.west/config ]; then
        west init -l /workspace/tflite-micro
        cd /workspace/tflite-micro
        west update

        touch /workspace/.west/initialized
        echo "West workspace initialized successfully"
    else
        echo "West workspace already initialized"
    fi

    if [ -f /workspace/zephyr/zephyr-env.sh ]; then
        echo "Sourcing Zephyr environment..."
        source /workspace/zephyr/zephyr-env.sh
    fi

    if [ ! -f /root/.zephyr_sourced ]; then
        echo 'if [ -f /workspace/zephyr/zephyr-env.sh ]; then source /workspace/zephyr/zephyr-env.sh; fi' >> /root/.bashrc
        touch /root/.zephyr_sourced
    fi
}
set -e

init_zephyr_env

exec "$@"
