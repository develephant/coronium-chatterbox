###############################################################################
## Monit
###############################################################################

apt_package 'monit'

cookbook_file "#{node['cs']['monit']}/monitrc" do
  source 'monit/monitrc.default'
  mode '0600'
  not_if "test -e #{node['cs']['monit']}/monitrc"
end

cookbook_file "#{node['cs']['monit']}/conf-available/chatterbox" do
  source 'monit/monitrc_chatterbox'
  mode '0644'
end

# Link Enabled
link "#{node['monit']['etc']}/conf-enabled/chatterbox" do
  to "#{node['monit']['etc']}/conf-available/chatterbox"
end

service 'monit' do
  action :reload
end
