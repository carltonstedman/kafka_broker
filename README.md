# Kafka Broker Cookbook

Install and configure a kafka broker.

Based off the work of [Federico Gimenez Nieto](https://github.com/fgimenez/kafka-cookbook)

# Cookbooks

* `kafka_broker::default`
    - Full default install
* `kafka_broker::install`
    - Install the application, but do not start
    - Useful for wrapper cookbooks that want custom configurations before starting
* `kafka_broker::configure`
    - Create the broker configs
* `kafka_broker::service`
    - Create service upstart scripts
