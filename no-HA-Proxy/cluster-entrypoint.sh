#!/bin/bash
set -e
echo "Running docker entrypoint for initial setup..."
docker-entrypoint.sh rabbitmq-server -detached
MASTER_NODE=rabbitmqmaster
echo "sleeping 10s for masternode setup"
sleep 10
echo "Stopping rabbitmq"
rabbitmqctl stop_app
echo "Joinning to $MASTER_NODE cluster"
rabbitmqctl join_cluster rabbit@$MASTER_NODE
echo "Stopping rabbitMq"
rabbitmqctl stop
echo "Starting rabbitmq-server"
sleep 2s
rabbitmq-server