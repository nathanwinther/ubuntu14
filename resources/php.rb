action :create do

  service 'apache2' do
    action :nothing
  end

  apt_package 'php5' do
    action :install
    notifies :restart, 'service[apache2]'
  end

  apt_package 'php-apc' do
    action :install
    notifies :restart, 'service[apache2]'
  end

  apt_package 'php5-curl' do
    action :install
    notifies :restart, 'service[apache2]'
  end

  apt_package 'php5-gd' do
    action :install
    notifies :restart, 'service[apache2]'
  end

  apt_package 'php5-imagick' do
    action :install
    notifies :restart, 'service[apache2]'
  end

  apt_package 'php5-memcache' do
    action :install
    notifies :restart, 'service[apache2]'
  end

  apt_package 'php5-mcrypt' do
    action :install
    notifies :restart, 'service[apache2]'
  end

  apt_package 'php5-mysql' do
    action :install
    notifies :restart, 'service[apache2]'
  end

  apt_package 'php5-xdebug' do
    action :install
    notifies :restart, 'service[apache2]'
  end

  apt_package 'php5-xmlrpc' do
    action :install
    notifies :restart, 'service[apache2]'
  end

  apt_package 'php5-xsl' do
    action :install
    notifies :restart, 'service[apache2]'
  end

  # mycrypt NOT ENABLED by default. Create symlinks
  link '/etc/php5/apache2/conf.d/30-mcrypt.ini' do
    to '../../mods-available/mcrypt.ini'
    action :create
    notifies :restart, 'service[apache2]'
  end

  link '/etc/php5/cli/conf.d/30-mcrypt.ini' do
    to '../../mods-available/mcrypt.ini'
    action :create
    notifies :restart, 'service[apache2]'
  end

end

