include_recipe "supervisor::default"

uwsgi_ooa_cmd = "/home/#{node['ooapi']['user']}/openonderwijsdata-api/bin/uwsgi  -s 127.0.0.1:9090 --master --wsgi-file app.py --callable app"

supervisor_service "ooa_uwsgi" do
    directory "/home/#{node['ooapi']['user']}/openonderwijsdata-api/src/app/"
    command uwsgi_ooa_cmd
    user node[:ooapi][:user]
    startsecs 10
    stopsignal "QUIT"
    stopasgroup true
    killasgroup true
end

nginx_site 'default' do
	enable	false
end

template "#{node['nginx']['dir']}/sites-available/ooa-flask" do
  source "ooaentry.erb"
  owner node[:ooapi][:user]
  group node[:ooapi][:group]
  mode 0644
  notifies :reload, "service[nginx]"
end

nginx_site 'ooa-flask' do
	enable true
end
