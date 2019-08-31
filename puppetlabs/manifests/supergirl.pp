#resource_type { "name_resource":
#	attribute => value
#	...
#}

$instalar = ['figlet','htop','linuxlogo']

package { $instalar:
	ensure => present,
}

exec { "memoria_livre":
	command => "/usr/bin/free -h > /tmp/memfree",
	user => "vagrant"
}

file{'/tmp/arquivo':
      content => "Testando",
      mode => "0756",
      owner => "vagrant",
      group => "root",
      ensure => present

}

service{'cron':
       enable => false,
       ensure => stopped

}

