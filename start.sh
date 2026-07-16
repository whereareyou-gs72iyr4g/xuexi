#!/bin/bash

service mysql start

service redis-server start

echo "================================"
echo "Backend Devbox Ready"
echo "Java:"
java -version

echo "Maven:"
mvn -version

echo "Node:"
node -v

echo "Redis:"
redis-cli ping

echo "================================"

exec bash
