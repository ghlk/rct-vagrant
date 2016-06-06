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

# node v0.12 and higher breaks mcrypt
if node['nodejs']['tx-version']['latest'] then include_recipe 'tx-nodejs::prepare_node' end
include_recipe 'nodejs'

directory node['nodejs']['srv_path'] do
  owner       node['nodejs']['user'] and group node['nodejs']['user'] and mode 0755
  recursive   true
  action      :create
end

execute "install global-modules #{node['nodejs']['global_modules'].join(' ')}" do
  command     "cd #{node['nodejs']['srv_path']}; npm install -g #{node['nodejs']['global_modules'].join(' ')}"
  action      :run

  not_if { node['nodejs']['global_modules'].empty? }
end

execute 'local-modules' do
  command     "cd #{node['nodejs']['srv_path']}; npm install"
  action      :run

  not_if { node['nodejs']['production'] }
  only_if { ::File.exists?("#{node['nodejs']['srv_path']}/package.json") }
end

if node['nodejs']['production'] then include_recipe 'tx-nodejs::prod' end

if node['nodejs'].attribute?('required_gems') && !node['nodejs']['required_gems'].empty?
  required_gems = node['nodejs']['required_gems']
  required_gems.each do |gems|
    gem_package gems do
      action :install
    end
  end
end
