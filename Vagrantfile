# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
sed -i s/archive/cn.archive/ /etc/apt/sources.list

apt-get update
apt-get install curl

curl -s https://get.docker.io/ubuntu/ | sudo sh

# Add the docker group if it doesn't already exist.
groupadd docker

# Add the connected user "${USER}" to the docker group.
# Change the user name to match your preferred user.
# You may have to logout and log back in again for
# this to take effect.
USER=vagrant
gpasswd -a ${USER} docker

service docker restart
sleep 5
SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provision "shell", inline: $script
end
