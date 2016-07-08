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

### MySQL 5.5

Standard Ubuntu MySQL 5.5.

Vagrant config

````
Vagrant.configure(2) do |config|
  config.vm.provision "chef_zero" do |chef|
    chef.json = {
      "ubuntu14" => {
        "mysql" => {
          "bind_address" => "127.0.0.1",
          "max_allowed_packet" => "16M",
          "root_password" => "",
          "remote_root" => false
        }
      }
    }
  end
end
````

Properties

**root_password:** Set the _root_ password. _Default is no password_  
**remote_root:** Create a remote _root_ login using the same password as **root_password**. _This should only be set for local vagrant development._  

### Apache2

Standard Ubuntu apache2 with the following modules installed and enabled:

* mod_rewrite
* mod_ssl

Vagrant config

````
Vagrant.configure(2) do |config|
  config.vm.provision "chef_zero" do |chef|
    chef.json = {
      "ubuntu14" => {
        "apache" => {
          "run_user" => "www-data",
          "run_group" => "www-data"
        }
      }
    }
  end
end
````

