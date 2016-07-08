property :run_user, String, default: 'www-data'
property :run_group, String, default: 'www-data'

action :create do

  apt_package 'apache2' do
    action :install
  end

  service 'apache2' do
    action [:enable, :start]
  end

  execute 'mod_rewrite' do
    command 'a2enmod rewrite'
    notifies :restart, 'service[apache2]'
    action :run
  end

  execute 'mod_ssl' do
    command 'a2enmod ssl'
    notifies :restart, 'service[apache2]'
    action :run
  end

  template '/etc/apache2/envvars' do
    source 'apache2.envvars.erb'
    owner 'root'
    group 'root'
    mode '0644'
    variables ({
      :run_user => run_user,
      :run_group => run_group
    })
    notifies :restart, 'service[apache2]'
  end
  
end

