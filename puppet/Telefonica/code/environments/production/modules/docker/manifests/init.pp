class docker {
	case $osfamily {
		"debian": {
			$pacotes = ['apt-transport-https','ca-certificates','curl','gnupg-agent','software-properties-common']
			$codename = $facts['os']['distro']['codename']
	
			exec{'apt_update':
				command => "/usr/bin/apt update"
			}

			exec{'docker_repo':
				command => "/usr/bin/add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu $codename stable'",
				onlyif => "/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | /usr/bin/apt-key add -",
				notify => Exec['apt_update'],
				require => Package[$pacotes]
			}

		}	

		"redhat": {
			$pacotes = ['yum-utils','device-mapper-persistent-data','lvm2']
		
			yumrepo{'docker_repo':
				descr => "Repositorio do Docker-CE",
				baseurl => 'https://download.docker.com/linux/centos/7/$basearch/stable',
				gpgkey => 'https://download.docker.com/linux/centos/gpg',
				gpgcheck => 1,
				enabled => 1,
				require => Package[$pacotes]
			}
	
		}
	}
	package{$pacotes:
		ensure => present,
		before => Package['docker-ce']
	}

	package{'docker-ce':
		ensure => present,
		before => Service['docker']

	}

	service{'docker':
		ensure => running,
		enable => true,
		subscribe => Package['docker-ce']
	}
}
