property :bind_address, String, default: '127.0.0.1'
property :max_allowed_packet, String, default: '16M'
property :root_password, String, default: ''
property :remote_root, [ TrueClass, FalseClass ], default: false

action :create do

  apt_package 'mysql-server' do
    action :install
  end

  service 'mysql' do
    action [:enable, :start]
  end

  # Config overrides
  template '/etc/mysql/conf.d/extra.cnf' do
    source 'mysql.extra.cnf.erb'
    owner 'root'
    group 'root'
    mode '0644'
    variables ({
      :bind_address => bind_address,
      :max_allowed_packet => max_allowed_packet
    })
    notifies :restart, 'service[mysql]'
  end

  # Run once
  run_once = node['ubuntu14']['run_once']

  directory run_once do
    action :create
    owner 'root'
    group 'root'
    mode '0755'
    recursive true
  end

  # Remote root
  remote_root_exists = run_once + '/remote_root'

  file remote_root_exists do
    action :create_if_missing
    notifies :run, 'execute[remote_root]', :immediately
    only_if { remote_root }
  end

  execute 'remote_root' do
    command "mysql --user=root --execute=\"CREATE USER 'root'@'%' IDENTIFIED BY ''; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;\" mysql"
    action :nothing
  end

  # Root password
  root_password_exists = run_once + '/root_password'

  file root_password_exists do
    action :create_if_missing
    notifies :run, 'execute[root_password]', :immediately
    only_if { ! root_password.empty? }
  end

  execute 'root_password' do
    command "mysql --user=root --execute=\"UPDATE user SET password = password('" + root_password + "') WHERE user = 'root'; FLUSH PRIVILEGES;\" mysql"
    action :nothing
  end

end

