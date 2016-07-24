# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Default VM
DEFAULT_BOX = "hashicorp/precise64"

# Chef paths
CHEF_COOKBOOKS_PATH = ["./chef/library/torx-cookbooks"]
CHEF_ROLES_PATH     = "./chef/roles"

# Domain
DEFAULT_DOMAIN      = "torx.dev"

# IP Addresses
RCT_SERVER_IP     = "192.168.200.201"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Vagrant plugin configs
  config.berkshelf.enabled              = true
  config.berkshelf.berksfile_path       = "./chef/library/Berksfile"
  config.hostmanager.enabled            = true
  config.hostmanager.manage_host        = true
  config.hostmanager.ignore_private_ip  = false
  config.hostmanager.include_offline    = true
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = '12.10.24'
  end

  config.vm.define "rct" do |rct|
    rct.vm.box = DEFAULT_BOX
    rct.vm.hostname = "rct.#{DEFAULT_DOMAIN}"
    rct.vm.synced_folder "../rct-react", "/srv/rct/"
    rct.vm.network "private_network", ip: RCT_SERVER_IP
    rct.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
    end
    rct.vm.provision "chef_solo" do |chef|
      chef.roles_path = CHEF_ROLES_PATH
      chef.add_role("tx-react")
    end
    rct.vm.provision "shell", inline: "echo Hello from Node React server!"
  end
end
