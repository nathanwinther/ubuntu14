#
# Cookbook Name:: ubuntu14
# Recipe:: mysqlclient
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

apt_package 'mysql-client-5.5' do
  action :install
end

