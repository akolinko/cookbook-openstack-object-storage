# encoding: UTF-8
#
# Cookbook Name:: openstack-object-storage
# Recipe:: swift-auth
#
# Copyright 2012, Rackspace US, Inc.
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

class Chef::Recipe # rubocop:disable Documentation
  include ::Openstack
  include Swiftauthkey
end

authkey = get_swift_authkey()
#get wrong service_pass now..
service_pass = get_password 'service', 'openstack-image'

execute "prep stats accountswaut" do
 cwd "/etc/swift"
 group root
 user root
 command <<-EOH
   swauth-add-account -K #{authkey} operations &&  swauth-add-user -a -K #{authkey} operations glance-images iPaDo9oh
   EOH
end