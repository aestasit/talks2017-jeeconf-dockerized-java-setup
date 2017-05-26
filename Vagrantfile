
Vagrant.configure("2") do |config|

  config.vm.box = "aestasit/devops-ubuntu-14.04"
  config.vm.hostname = "docker-java"
  config.vm.network "private_network", ip: "192.168.123.45"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "docker-java"
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

end


