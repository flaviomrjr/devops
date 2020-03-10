class graylog {
	file {'/etc/rsyslog.d/graylog.conf':
		source => "puppet:///modules/graylog/graylog.conf",
		ensure => present,
		before => Service['rsyslog']
	}
	
	service {'rsyslog':
		ensure => running,
		enable => true,
		subscribe => File['/etc/rsyslog.d/graylog.conf']
	}
}
