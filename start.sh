#!/bin/bash


echo ""
echo "======================================"
echo "        XUEXI BACKEND DEVBOX"
echo "======================================"
echo ""


echo "[1] Starting Redis..."

service redis-server start


echo "[2] Starting MySQL..."

service mysql start


sleep 3


if [ ! -f /root/.mysql_initialized ]; then

    echo "[3] First MySQL initialization"

    /usr/local/bin/mysql-init.sh

    touch /root/.mysql_initialized

else

    echo "[3] MySQL already initialized"

fi


echo ""
echo "========== Environment =========="


echo "Java:"
java -version 2>&1 | head -n 2


echo ""

echo "Maven:"
mvn -version | head -n 2


echo ""

echo "Node:"
node -v


echo ""

echo "Redis:"
redis-cli ping || true


echo ""

echo "MySQL:"
mysql -uroot -proot -e "select version();" || true


echo ""
echo "================================="

echo ""
echo "Workspace:"
echo "/workspace"


echo ""
echo "Useful:"
echo "  mvn spring-boot:run"
echo "  mysql -uroot -proot"
echo "  redis-cli"
echo ""

exec bash

