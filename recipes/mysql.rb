#
# Cookbook Name:: ubuntu14
# Recipe:: mysql
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

ubuntu14_mysql 'mysql' do
  bind_address node['ubuntu14']['mysql']['bind_address']
  max_allowed_packet node['ubuntu14']['mysql']['max_allowed_packet']
  root_password node['ubuntu14']['mysql']['root_password']
  remote_root node['ubuntu14']['mysql']['remote_root']
  action :create
end

