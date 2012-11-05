class eb-hadoop::namenode 
(
	$service_state = 'run',
)
{

	include eb-hadoop::params

	if ($service_state == 'install'){

		eb-hadoop::createdir{$eb-hadoop::params::DFS_NAMENODE_NAME_DIR:
			owner => 'root',
			group => 'root',
			mode  => 0777,
			method => 'install'
		}	
	
		class {'eb-hadoop::namenode::format':}	
	
		Eb-hadoop::Createdir[$eb-hadoop::params::DFS_NAMENODE_NAME_DIR] -> Class['eb-hadoop::namenode::format'] 

	} elsif ($service_state == 'stop' or $service_state == 'run') {

		eb-hadoop::service{'namenode':
			service_state => $service_state
		}
	}

}
