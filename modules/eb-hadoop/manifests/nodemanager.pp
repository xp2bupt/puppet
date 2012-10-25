class eb-hadoop::nodemanager {

	include eb-hadoop::params

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
}
