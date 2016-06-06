## Vagrant Dev Environment
Vagrant environment dependencies

1. Install Xcode
2. Install Xcode command line tools
3. Install ChefDk - https://downloads.chef.io/chef-dk/
4. Install VirtualBox v5.0+
5. Install Vagrant - Make sure you are running version 1.7.4 ($ vagrant -v)
6. Install Vagrant plugins:

In terminal:

    $ vagrant plugin install vagrant-omnibus
    $ vagrant plugin install vagrant-berkshelf
    $ vagrant plugin install vagrant-hostmanager
    $ vagrant plugin install vagrant-vbguest

#### Getting Started
Clone the git repository

cd to the root of your local cloned repository

To instantiate your dev environment:

    $ vagrant up


To stop all machines:

    $ vagrant [destroy:halt:suspend] # See vagrant docs for usage details


To instantiate only one machine:

    $ vagrant up [machine name]


To stop only one machine:

    $ vagrant [destroy:halt:suspend] [machine name]


To reload a machine:

    $ vagrant reload [machine name]


To reload a machine and rerun provisioning:

    $ vagrant reload --provision [machine name]


To ssh into a machine:

    $ vagrant ssh [machine name]
