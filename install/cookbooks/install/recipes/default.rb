#
# Cookbook Name:: cloud
# Recipe:: cloud
#
# Copyright 2016-17 C. Byerley
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

apt_update 'update apt' do
  action :update
end

apt_package 'uuid'

###############################################################################
# User
###############################################################################

user 'coronium' do
  manage_home true
  home node['cs']['home']
  shell '/bin/bash'
  password node['cs']['password']
  not_if "test -d #{node['cs']['home']}"
end

group 'sudo' do
  action :modify
  members ['coronium']
  not_if "test -d #{node['cs']['home']}"
end

###############################################################################
# Scaffold
###############################################################################

%w(chatterbox chatterbox/logs).each do |dir|
  directory "#{node['cs']['home']}/#{dir}" do
    owner node['cs']['user']
    group node['cs']['group']
    mode '0755'
    recursive true
  end
end

template "#{node['cs']['home']}/chatterbox/config.lua" do
  source 'config.lua.erb'
  owner node['cs']['user']
  group node['cs']['group']
  mode '0600'
end

cookbook_file "#{node['cs']['bin']}/chatterbox" do
  source 'chatterbox'
  owner node['cs']['user']
  group node['cs']['group']
  mode '0750'
end

template "#{node['cs']['bin']}/cbrun" do
  source 'bin/cbrun.erb'
  owner node['cs']['user']
  group node['cs']['group']
  mode '0750'
end

###############################################################################
# Logrotate
###############################################################################
file '/etc/logrotate.d/chatterbox' do
  owner node['cs']['user']
  group node['cs']['group']
  mode '0664'
  content <<-EOF
#{node['cs']['home']}/logs/chatterbox.log {
  size 3mb
  copytruncate
  create 0660 #{node['cs']['user']} #{node['cs']['group']}
  dateext
  rotate 1
  compress
}
  EOF
end

###############################################################################
# SSH
###############################################################################
bash 'allow passwords' do
  cwd '/etc/ssh'
  code <<-EOF
  if [ -e sshd_config ]
  then
    sed 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' -i sshd_config
  fi
  EOF
end

service 'ssh' do
  action :reload
end

###############################################################################
# System
###############################################################################

# host
bash 'Set hostname' do
  cwd '/etc'
  code <<-EOH
    echo "127.0.0.1 $(hostname)" >> hosts
  EOH
  not_if 'grep $(hostname) /etc/hosts'
end

# monit
include_recipe '::monit'

###############################################################################
# Fin
###############################################################################
template "#{node['cs']['home']}/chatterbox/chatterbox.index" do
  source 'chatterbox.index.erb'
  owner node['cs']['user']
  group node['cs']['group']
  mode '0440'
end
