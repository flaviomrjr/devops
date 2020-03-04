class mera::del_apache {
	package{"apache2":
		ensure => absent,
		require => Service['apache2'] #PACKAGE PRECISA QUE O SERVICO SEJA PARADO PRIMEIRO
	}

	service{"apache2":
		ensure => stopped,
		notify => Package['apache2'] #INFORMA QUE O SERVICO FOI PARADO
	}
}
