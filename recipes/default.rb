#
# Cookbook Name:: ubuntu14
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'ubuntu14::apt'
include_recipe 'ubuntu14::mysql'
include_recipe 'ubuntu14::apache'
include_recipe 'ubuntu14::php'

