base_install_dir = ::File.dirname(node['kafka_broker']['install_dir'])
tarball_file_base = node['kafka_broker']['tarball_file_base']
tarball_file = node['kafka_broker']['tarball_file']

tarball_file_path = ::File.join(base_install_dir, tarball_file)
remote_file tarball_file_path do
  action :create_if_missing
  source node['kafka_broker']['tarball_url']
  not_if { ::File.exist?(::File.join(base_install_dir, tarball_file_base)) }
  notifies :run, 'execute[unzip kafka source]'
end

execute 'unzip kafka source' do
  command "tar -zxvf #{tarball_file}"
  cwd base_install_dir
  action :nothing
  notifies :delete, "file[#{tarball_file_path}]", :immediately
  notifies :create, "directory[#{node['kafka_broker']['log_dir']}]", :immediately
end

link node['kafka_broker']['install_dir'] do
  to ::File.join(base_install_dir, tarball_file_base)
end

directory node['kafka_broker']['log_dir'] do
  action :nothing
end

file tarball_file_path do
  action :nothing
end
