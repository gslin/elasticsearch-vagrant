# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["VAGRANT_DEFAULT_PROVIDER"] = "docker"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.provider :docker do |docker, override|
        docker.image = "fgrehm/vagrant-ubuntu:precise"
        docker.has_ssh = true
        override.ssh.port = 22
    end

    config.vm.provision :shell, path: "install.sh"
end
