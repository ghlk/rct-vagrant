#
# Cookbook Name:: tx-nodejs
# Recipe:: default
#
# Copyright 2015, Torx IO
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
#

execute 'local-modules' do
  command     "cd #{node['nodejs']['srv_path']}; npm install --production"
  action      :run

  only_if     { node['nodejs']['production'] }
  only_if     { ::File.exists?("#{node['nodejs']['srv_path']}/package.json") }
end

execute 'set-port' do
  command     "echo 'export PORT=8081' >> /home/#{node['nodejs']['user']}/.bashrc"
  action      :run
end

execute 'set-port' do
  command     "echo 'export PORT_SSL=8443' >> /home/#{node['nodejs']['user']}/.bashrc"
  action      :run

  only_if     { node['nodejs']['use_ssl'] }
end

execute 'set-environment' do
  command     "echo 'export NODE_ENV=\"production\"' >> /home/#{node['nodejs']['user']}/.bashrc"
  action      :run
end
