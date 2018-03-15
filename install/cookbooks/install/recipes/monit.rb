###############################################################################
## Monit
###############################################################################

apt_package 'monit'

cookbook_file "#{node['cs']['monit']}/monitrc" do
  source 'monit/monitrc.default'
  mode '0600'
end

cookbook_file "#{node['cs']['monit']}/conf-available/chatterbox_monit" do
  source 'monit/chatterbox_monit'
  mode '0644'
end

# Link Enabled
link "#{node['cs']['monit']}/conf-enabled/chatterbox_monit" do
  to "#{node['cs']['monit']}/conf-available/chatterbox_monit"
end

service 'monit' do
  action :reload
end
