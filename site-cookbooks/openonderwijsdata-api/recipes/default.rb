#
# Cookbook Name:: openonderwijsdata-api
# Recipe:: default
#
# Copyright 2014 Djuri Baars
include_recipe 'build-essential::default'
include_recipe 'python'
include_recipe 'apt'
include_recipe "nodejs::nodejs_from_package"
include_recipe "nginx::default"

%w{python-setuptools python-dev libssl-dev gcc libxml2-dev libxslt-dev libffi-dev git language-pack-en language-pack-nl byobu apt-transport-https telnet}
.each do |pkg|
    package pkg do
        action :install
    end
end

python_virtualenv "/home/#{node['ooapi']['user']}/openonderwijsdata-api" do
    owner node[:ooapi][:user]
    group node[:ooapi][:group]
    action :create
end

%w{twisted scrapy lxml w3lib cryptography cssselect uwsgi}
.each do |py_pkg|
    python_pip py_pkg do
        virtualenv "/home/#{node['ooapi']['user']}/openonderwijsdata-api"
    end
end

%w{less bower grunt-cli}
.each do |npm_pkg|
    nodejs_npm npm_pkg
end

git "/home/#{node['ooapi']['user']}/openonderwijsdata-api/src" do
    repository "https://github.com/dsbaars/openonderwijsdata-api"
    revision "address_components"
    user node[:ooapi][:user]
    group node[:ooapi][:group]
    action :checkout
end
