class eb-hadoop::datanode 
(
	$service_state = 'run',
)
{
	
	include eb-hadoop::params

	if ($service_state == 'install') {
		
		eb-hadoop::createdir{$eb-hadoop::params::DFS_DATANODE_DATA_DIR:
			owner => 'root',
			group => 'root',
			mode  => 0777,
			method => 'install'
		}		
	
	} elsif ($service_state == 'stop' or $service_state == 'run') {

		eb-hadoop::service{'datanode':
                        service_state => $service_state
                }

	} 



}
