
# RabbitMQ Cluster - Docker Compose

This repo has two Docker composes options for building a RabbitMQ Cluster on Docker Composer using or not using HAProxy to handle the requests.


## Deploy

To execute this project, run the following command.

**Ports 8080 and 5672 are required, otherwise TCP socket bind error will be shown.


```bash
  docker compose up
```


## Functions

- Two options for implementation
- HA Proxy deploys rabbitMQ and HAProxy Containers, access will be done through HAProxy which will load balance(round robin) the access on RabbitMQ farm
  - Queue mirroring is not enabled, as stated on RabbitMQ docs: https://www.rabbitmq.com/ha.html, please use Quorum Queues: https://www.rabbitmq.com/quorum-queues.html
- no-HA-Proxy deploys farm of rabbitMQ in cluster, but no Proxy to access, each management site and cluster node has it own port mapping

