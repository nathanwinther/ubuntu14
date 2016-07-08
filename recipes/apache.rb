#
# Cookbook Name:: ubuntu14
# Recipe:: apache
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

ubuntu14_apache 'apache2' do
  run_user node['ubuntu14']['apache']['run_user']
  run_group node['ubuntu14']['apache']['run_group']
  action :create
end

