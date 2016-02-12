# -*- mode: ruby -*-
# vi: set filetype=ruby :

VAGRANT_API_VERSION = "2"

Vagrant.configure(VAGRANT_API_VERSION) do |config|

  config.vm.box = "cmiles/gentoo-amd64-minimal"
  config.vm.hostname = "gentoo.box"
  config.vm.provision "shell", path: "bootstrap.sh"

  config.vm.provider :virtualbox do |vbox|
    vbox.cpus = "1"
    vbox.memory = "1024"
    vbox.name = "Gentoo"
  end

  config.ssh.username = "brenj"
  config.ssh.private_key_path = "~/.ssh/id_rsa"
  config.ssh.forward_agent = true

end