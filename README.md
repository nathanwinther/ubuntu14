# Chef ubuntu-14 LAMP cookbook

## Usage

### Standard

Apache2, PHP5, MySQL 5.5

Vagrant config

````
Vagrant.configure(2) do |config|
  config.vm.provision "chef_zero" do |chef|
    chef.add_recipe "ubuntu14"
  end
end
````

### Include memcached

Vagrant config

````
Vagrant.configure(2) do |config|
  config.vm.provision "chef_zero" do |chef|
    chef.add_recipe "ubuntu14"
    chef.add_recipe "ubuntu14::memcached"
  end
end
````

## Cookbook

### Apache2

Standard Ubuntu apache2 with the following modules installed and enabled:

* mod_rewrite
* mod_ssl

