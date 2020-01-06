#
# Cookbook Name:: apache2
# Recipe:: default
#
# Copyright (c) 2020 The Authors, All Rights Reserved.
apt_update 'Daily update the apt cache' do
  frequency 86_400
  action :periodic
end

package 'apache2'

service 'apache2' do
  supports status: true
  action [:enable, :start]
end

template '/var/www/html/index.html' do # ~FC033
  source 'index.html.erb'
end
