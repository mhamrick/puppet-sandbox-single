Vagrant.configure("2") do |config|
  config.vm.hostname = 'testvm.example.local'

  config.vm.provider "virtualbox" do |v|
    v.gui = false
  end
   # Enable the Puppet provisioner, with will look in manifests
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "modules"
  end          
  
  config.vm.box = 'centos65'
  config.vm.box_url =  'http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box'
  # Forward guest port 80 to host port 8888 and name mapping
#  config.vm.forward_port 80, 8888
  config.vm.network "forwarded_port", guest: 80, host: 8888
  config.vm.synced_folder "html/", "/var/www/html"            
  config.vm.synced_folder "one/", "/var/www/one"            
end   
