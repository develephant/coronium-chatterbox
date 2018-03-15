###############################################################################
## Monit
###############################################################################

apt_package 'monit'

cookbook_file "#{node['cs']['monit']}/monitrc" do
  source 'monit/monitrc.default'
  mode '0600'
end

cookbook_file "#{node['cs']['monit']}/conf.d/chatterbox" do
  source 'monit/monitrc_chatterbox'
  mode '0644'
end

service 'monit' do
  action :reload
end
