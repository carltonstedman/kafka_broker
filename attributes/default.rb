# encoding: UTF-8
# Cookbook Name:: kafka_broker
# Attribute:: default
#

default["kafka_broker"]["version"] = "0.8.1.1"
default["kafka_broker"]["scala_version"] = "2.10"

default["kafka_broker"]["user"] = "kafka"

default["kafka_broker"]["install_java"] = true

default["kafka_broker"]["install_dir"] = "/usr/local/kafka"
default["kafka_broker"]["log_dir"] = "/var/log/kafka"
default["kafka_broker"]["bin_dir"] = "/usr/local/kafka/bin"
default["kafka_broker"]["config_dir"] = "/usr/local/kafka/config"

default["kafka_broker"]["service_style"] = "upstart"

default["kafka_broker"]["broker.id"] = nil
default["kafka_broker"]["port"] = 9092
default["kafka_broker"]["zookeeper.connect"] = nil

default["kafka_broker"]["conf"]["server"] = {
  "file" => "server.properties",
  "entries" => {
    "num.network.threads" => "2",
    "num.io.threads" => "8",
    "socket.send.buffer.bytes" => "1048576",
    "socket.receive.buffer.bytes" => "1048576",
    "socket.request.max.bytes" => "104857600",
    "log.dirs" => node["kafka_broker"]["log_dir"],
    "num.partitions" => "2",
    "log.retention.hours" => "168",
    "log.segment.bytes" => "536870912",
    "log.retention.check.interval.ms" => "60000",
    "log.cleaner.enable" => "false",
    "zookeeper.connection.timeout.ms" => "1000000"
  }
}

default["kafka_broker"]["conf"]["log4j"] = {
  "file" => "log4j.properties",
  "entries" => {
    "log4j.rootLogger" => "INFO, stdout ",
    "log4j.appender.stdout" => "org.apache.log4j.ConsoleAppender",
    "log4j.appender.stdout.layout" => "org.apache.log4j.PatternLayout",
    "log4j.appender.stdout.layout.ConversionPattern" => "[%d] %p %m (%c)%n",
    "log4j.appender.kafkaAppender" => "org.apache.log4j.DailyRollingFileAppender",
    "log4j.appender.kafkaAppender.DatePattern" => "'.'yyyy-MM-dd-HH",
    "log4j.appender.kafkaAppender.File" => "${kafka.logs.dir}/server.log",
    "log4j.appender.kafkaAppender.layout" => "org.apache.log4j.PatternLayout",
    "log4j.appender.kafkaAppender.layout.ConversionPattern" => "[%d] %p %m (%c)%n",
    "log4j.appender.stateChangeAppender" => "org.apache.log4j.DailyRollingFileAppender",
    "log4j.appender.stateChangeAppender.DatePattern" => "'.'yyyy-MM-dd-HH",
    "log4j.appender.stateChangeAppender.File" => "${kafka.logs.dir}/state-change.log",
    "log4j.appender.stateChangeAppender.layout" => "org.apache.log4j.PatternLayout",
    "log4j.appender.stateChangeAppender.layout.ConversionPattern" => "[%d] %p %m (%c)%n",
    "log4j.appender.requestAppender" => "org.apache.log4j.DailyRollingFileAppender",
    "log4j.appender.requestAppender.DatePattern" => "'.'yyyy-MM-dd-HH",
    "log4j.appender.requestAppender.File" => "${kafka.logs.dir}/kafka-request.log",
    "log4j.appender.requestAppender.layout" => "org.apache.log4j.PatternLayout",
    "log4j.appender.requestAppender.layout.ConversionPattern" => "[%d] %p %m (%c)%n",
    "log4j.appender.cleanerAppender" => "org.apache.log4j.DailyRollingFileAppender",
    "log4j.appender.cleanerAppender.DatePattern" => "'.'yyyy-MM-dd-HH",
    "log4j.appender.cleanerAppender.File" => "log-cleaner.log",
    "log4j.appender.cleanerAppender.layout" => "org.apache.log4j.PatternLayout",
    "log4j.appender.cleanerAppender.layout.ConversionPattern" => "[%d] %p %m (%c)%n",
    "log4j.appender.controllerAppender" => "org.apache.log4j.DailyRollingFileAppender",
    "log4j.appender.controllerAppender.DatePattern" => "'.'yyyy-MM-dd-HH",
    "log4j.appender.controllerAppender.File" => "${kafka.logs.dir}/controller.log",
    "log4j.appender.controllerAppender.layout" => "org.apache.log4j.PatternLayout",
    "log4j.appender.controllerAppender.layout.ConversionPattern" => "[%d] %p %m (%c)%n",
    "log4j.logger.kafka" => "INFO, kafkaAppender",
    "log4j.logger.kafka.network.RequestChannel$" => "WARN, requestAppender",
    "log4j.additivity.kafka.network.RequestChannel$" => "false",
    "#log4j.logger.kafka.network.Processor" => "TRACE, requestAppender",
    "#log4j.logger.kafka.server.KafkaApis" => "TRACE, requestAppender",
    "#log4j.additivity.kafka.server.KafkaApis" => "false",
    "log4j.logger.kafka.request.logger" => "WARN, requestAppender",
    "log4j.additivity.kafka.request.logger" => "false",
    "log4j.logger.kafka.controller" => "TRACE, controllerAppender",
    "log4j.additivity.kafka.controller" => "false",
    "log4j.logger.kafka.log.LogCleaner" => "INFO, cleanerAppender",
    "log4j.additivity.kafka.log.LogCleaner" => "false",
    "log4j.logger.state.change.logger" => "TRACE, stateChangeAppender",
    "log4j.additivity.state.change.logger" => "false"
  }
}
