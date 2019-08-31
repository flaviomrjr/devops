class mera::install_nginx {
	package {'nginx':
		ensure => present,
		require => Package["apache2"]
	}

 	~> service{'nginx': #SO EXECUTA SERVICE SE A CHAMADA ANTERIOR FOR EXEUCTADO
		ensure => "running",
		enable => true
	}

#-> EXECUTA PRIMEIRO
}


	
