class eb-hadoop::nodemanager 
(
	$service_state = 'run'
)
{

	include eb-hadoop::params

	if ($service_state == 'install'){

		eb-hadoop::createdir {$eb-hadoop::params::YARN_NODEMANAGER_LOCAL_DIRS:
			owner => 'root',
			group => 'root',
			mode  =>  0777 ,
			method => 'install'
		}

		eb-hadoop::createdir {$eb-hadoop::params::YARN_NODEMANAGER_LOG_DIRS:
			owner => 'root',
			group => 'root',
			mode  =>  0777 ,
			method => 'install'
		}
	
		Eb-hadoop::Createdir[$eb-hadoop::params::YARN_NODEMANAGER_LOCAL_DIRS] -> Eb-hadoop::Createdir[$eb-hadoop::params::YARN_NODEMANAGER_LOG_DIRS]

	} elsif ($service_state == 'stop' or $service_state == 'run') {

		eb-hadoop::service {'nodemanager':
                        service_state => $service_state
                }

	}
}
