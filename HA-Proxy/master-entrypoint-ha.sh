#!/bin/bash
set -e
echo "Running docker entrypoint for initial setup..."
docker-entrypoint.sh rabbitmq-server -detached
echo "Stopping rabbitmq"
rabbitmqctl stop_app
echo "Setting HA-ALL for RabbitMQ"
rabbitmqctl set_policy ha-all '' '{\"ha-mode\":\"all\", \"ha-sync-mode\":\"automatic\"}'
echo "Starting rabbitmq-server"
sleep 2s
rabbitmq-server
 #https://www.rabbitmq.com/ha.html
 #feature will be removed on future versions
 #Check if your usage case supports quorum queues: https://www.rabbitmq.com/quorum-queues.html