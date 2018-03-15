###############################################################################
## Monit
###############################################################################

apt_package 'monit'

cookbook_file "#{node['cs']['monit']}/monitrc" do
  source 'monit/monitrc.default'
  mode '0600'
  not_if "test -e #{node['cs']['monit']}/monitrc"
end

cookbook_file "#{node['cs']['monit']}/conf-available/chatterbox_monit" do
  source 'monit/chatterbox_monit'
  mode '0644'
end

# Link Enabled
link "#{node['monit']['cs']}/conf-enabled/chatterbox_monit" do
  to "#{node['monit']['cs']}/conf-available/chatterbox_monit"
end

service 'monit' do
  action :reload
end
