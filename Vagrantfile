# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["VAGRANT_DEFAULT_PROVIDER"] = "docker"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.provider :docker do |docker|
        docker.image = "fgrehm/vagrant-ubuntu:precise"
        docker.ports = ["9200:9200"]
    end

    config.vm.provision :shell, path: "install.sh"
end
