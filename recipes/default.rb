#
# Cookbook:: sshd
# Recipe:: default
#
# Copyright:: 2017, Richard Nixon
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

case node['os']
when /solaris/
  service_name = 'ssh'
when /linux/
  service_name = 'sshd'
else
  raise "sshd: Unsupported OS #{node['os']}"
end

service service_name do
  supports  :restart => true
  action    :nothing
end

# CIS level 1 recommends file mode 600 and owner to be root
template "/etc/ssh/sshd_config" do
  source    'sshd_config.erb'
  owner 'root'
  group 'root'
  mode  '0600'
  notifies  :restart, "service[#{service_name}]"
end

file '/etc/issue' do
  content node['sshd']['legal_banner']
  owner 'root'
  group 'root'
  mode  '0644'
end
