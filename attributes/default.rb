default['kafka_broker']['version'] = '0.8.1.1'
default['kafka_broker']['scala_version'] = '2.10'

default['kafka_broker']['tarball_file_base'] = "kafka_#{node['kafka_broker']['scala_version']}-#{node['kafka_broker']['version']}"
default['kafka_broker']['tarball_file'] = "#{node['kafka_broker']['tarball_file_base']}.tgz"
default['kafka_broker']['tarball_url'] = "http://apache.rediris.es/kafka/#{node['kafka_broker']['version']}/kafka_#{node['kafka_broker']['scala_version']}-#{node['kafka_broker']['version']}.tgz"

default['kafka_broker']['install_dir'] = "/usr/local/kafka"
default['kafka_broker']['log_dir'] = "/usr/local/kafka/logs"

default['kafka_broker']['build_command'] = './sbt && ./sbt package && ./sbt assembly-package-dependency'
