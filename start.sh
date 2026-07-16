#!/bin/bash

echo "Starting Redis..."
service redis-server start

echo "Starting MySQL..."
service mysql start

echo ""
echo "=============================="
echo "Backend Devbox Ready"
echo "=============================="

echo "Java:"
java -version

echo ""
echo "Maven:"
mvn -version

echo ""
echo "Node:"
node -v

echo ""
echo "Redis:"
redis-cli ping || true

echo ""
echo "=============================="

exec bash
