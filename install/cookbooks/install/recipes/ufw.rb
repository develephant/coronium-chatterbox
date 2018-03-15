###############################################################################
## UFW
###############################################################################

apt_package 'ufw'

bash 'configure UFW' do
  code <<-EOF
  ufw allow ssh
  ufw allow 7175/tcp
  ufw --force enable
  EOF
end
