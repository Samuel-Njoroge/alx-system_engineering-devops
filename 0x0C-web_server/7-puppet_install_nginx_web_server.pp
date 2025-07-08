# Ensure nginx is installed
package { 'nginx':
  ensure => installed,
}

# Ensure nginx is running and enabled
service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  require    => Package['nginx'],
}

# Ensure the "Hello World!" homepage is present
file { '/var/www/html/index.html':
  ensure  => file,
  content => "Hello World!\n",
  require => Package['nginx'],
}

# Create the redirection target page
file { '/var/www/html/new_page.html':
  ensure  => file,
  content => "You have been redirected.\n",
  require => Package['nginx'],
}

# Modify the default Nginx site config
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/custom_default.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}
