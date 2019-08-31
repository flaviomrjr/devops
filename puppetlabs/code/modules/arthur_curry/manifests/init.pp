class arthur_curry {
	case $osfamily {
		"redhat": {
			$pacote = ['epel-release','git','vim','fortune-mod','figlet','fish']
		} #FIM DO REDHAT
		"debian": {
			exec{'atualia_repo' :
				command => "/usr/bin/apt update"
			}
			$pacote = ['git','vim','fortunes-br','figlet','fish','sysstat']
		} # FIM DO DEBIAN
	} #FIM DO CASA
	
	package {$pacote:
		ensure => present
	}
	
	file{'/root/.bashrc':
		source => "puppet:///modules/arthur_curry/bashrc_base",
		ensure => present,
	}

	file{'/root/.bash_logout':
		source => "puppet:///modules/arthur_curry/bashrc_logout",
		ensure => present,
	}

	user{'aqualad' :
		ensure => present,
		managehome => true,
		shell => "/usr/bin/fish",
		password => Sensitive("4linux") #OR RASH openssl passwd -6 or -1 MD5 /etc/shadow where I find the password rash
	}
		
} #FIM DO CASA
