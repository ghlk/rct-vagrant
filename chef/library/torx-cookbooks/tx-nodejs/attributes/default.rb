# === VERSION AND LOCATION
#


# # === NAMING
# #

#
# # === USER & PATHS
# #
default['nodejs']['user']                   = nil
default['nodejs']['srv_path']               = "/srv/#{node['hostname']}"

# # === Options
# #
default['nodejs']['global_modules']         = []
default['nodejs']['production']             = false
default['nodejs']['use_ssl']                = false
default['nodejs']['tx-version']['latest']   = false

# # === Git
# #
default['git']['app']['repo']               = nil
default['git']['app']['reference']          = 'master'
default['git']['ssh_wrapper']['template']   = "wrap-ssh4git.sh.erb"
default['git']['ssh_wrapper']['path']       = "/tmp"
