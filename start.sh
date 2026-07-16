#!/bin/bash


echo ""
echo "======================================"
echo "        XUEXI BACKEND DEVBOX"
echo "======================================"
echo ""



echo "[1] Starting Redis..."




service redis-server start


echo "[1.5] Starting RabbitMQ..."

service rabbitmq-server start || true


echo "[1.6] Starting Kafka..."

if [ -d /opt/kafka ]; then

    cd /opt/kafka

    if [ -f bin/zookeeper-server-start.sh ]; then
        nohup bin/zookeeper-server-start.sh \
        config/zookeeper.properties \
        >/tmp/zookeeper.log 2>&1 &
    fi

    sleep 5

    nohup bin/kafka-server-start.sh \
    config/server.properties \
    >/tmp/kafka.log 2>&1 &

    cd /workspace

fi




echo "[2] Starting MySQL..."

service mysql start


sleep 3


if [ ! -f /root/.mysql_initialized ]; then

    
echo "[3] Starting Nacos..."

if [ -f /opt/nacos-server/bin/startup.sh ]; then
    cd /opt/nacos-server/bin
    ./startup.sh -m standalone
    cd /workspace
fi


echo "[4] MySQL initialization..."


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

