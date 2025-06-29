file { '/home/vagrant/.ssh':
  ensure => 'directory',
  owner  => 'vagrant',
  group  => 'vagrant',
  mode   => '0700',
}

file { '/home/vagrant/.ssh/config':
  ensure => 'present',
  owner  => 'vagrant',
  group  => 'vagrant',
  mode   => '0600',
}

file_line { 'Declare identity file':
  path  => '/home/vagrant/.ssh/config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^\s*IdentityFile',
}

file_line { 'Turn off passwd auth':
  path  => '/home/vagrant/.ssh/config',
  line  => '    PasswordAuthentication no',
  match => '^\s*PasswordAuthentication',
}
