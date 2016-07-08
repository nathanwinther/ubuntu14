#
# Cookbook Name:: ubuntu14
# Recipe:: memcached
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

apt_package 'memcached' do
  action :install
end

