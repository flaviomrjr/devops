class asa_noturna {
	
	if $facts['hostname'] == 'docker' {
		$env = "containers"
	}
	else {
		$env = "production"
	}
	
	file {"/etc/puppetlabs/puppet/puppet.conf":
		content => template("asa_noturna/puppet.conf.erb"),
		ensure => present,
		before => Service['puppet']
	}
	
	service {'puppet':
		ensure => running,
		enable => true,
		subscribe => File['/etc/puppetlabs/puppet/puppet.conf']
	}
}
