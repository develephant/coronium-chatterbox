#######################################################################################################################
## Coronium ChatterBox
#######################################################################################################################
default['cs']['version']                 = '1.0'
default['cs']['release']                 = 'beta'
default['cs']['repo_base']               = 'https://github.com/develephant'
default['cs']['branch']                  = 'master'
#######################################################################################################################
# Core User
#######################################################################################################################
default['cs']['user']                    = 'coronium'
default['cs']['group']                   = 'coronium'
default['cs']['password']                = '$1$/tAye9C/$HqrGvoMnJZ2qfoIHRi7DN0'
#######################################################################################################################
# Core Paths
#######################################################################################################################
default['cs']['home']                    = '/home/coronium'
default['cs']['bin']                     = '/usr/local/bin'
default['cs']['lib']                     = '/usr/local/lib'
default['cs']['monit']                   = '/etc/monit'
#######################################################################################################################
# Default Config - config.lua.erb
#######################################################################################################################
default['conf']['key']                  = '8477ebc412386117059664d45637e397'
default['conf']['room']                 = 'Lobby'
default['conf']['port']                 = 7175
default['conf']['timeout']              = 900
