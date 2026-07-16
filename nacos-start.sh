#!/bin/bash

echo "Starting Nacos..."

if [ -f /opt/nacos/bin/startup.sh ]; then
    cd /opt/nacos/bin
    ./startup.sh -m standalone
fi

