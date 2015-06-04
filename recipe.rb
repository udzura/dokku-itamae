puts "My name is: #{node[:name]}"

execute "apt-get update" do
  action :run
end

package 'git' do
  action :install
end

package 'build-essential' do
  action :install
end

git '/var/tmp/dokku' do
  action :sync
  repository 'https://github.com/progrium/dokku.git'
end

execute "install dokku" do
  command 'make install'
  cwd '/var/tmp/dokku'
  not_if 'which dokku'
end
