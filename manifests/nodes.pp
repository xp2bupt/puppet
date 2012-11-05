#$service_state = 'install'
$service_state = 'run'
#$service_state = 'stop'
#$service_state = 'config'

node 'vbaby2.cloud.eb' {
	#	userAdd test
	#stage{1:}
	#class {'eb-hadoop::adduser': stage => 1}

	#	hadoop install test
	stage{1:} -> stage{2:} -> stage{3:} -> stage{4:}
	class {'eb-jdk': stage => 1}
	class {'eb-hadoop':
		stage => 2,
		service_state => $service_state 
	}
	class {'eb-hadoop::datanode': 
		stage => 3,
		service_state => $service_state
	}
	class {'eb-hadoop::nodemanager': 
		stage => 4,
		service_state => $service_state
	}
}

node 'vbaby4.cloud.eb' {

        stage{1:} -> stage{2:} -> stage{3:} -> stage{4:}

	class {'eb-jdk': stage => 1}
        class {'eb-hadoop': 
		stage => 2,
		service_state => $service_state
	}
        class {'eb-hadoop::datanode':
		stage => 3,
		service_state => $service_state
	}
        class {'eb-hadoop::nodemanager': 
		stage => 4,
		service_state => $service_state
	}
}

node 'vbaby5.cloud.eb' {

        stage{1:} -> stage{2:} -> stage{3:} -> stage{4:}

	class {'eb-jdk': stage => 1}
        class {'eb-hadoop': 
		stage => 2,
		service_state => $service_state
	}
        class {'eb-hadoop::datanode':
		stage => 3,
		service_state => $service_state
	}
        class {'eb-hadoop::nodemanager': 
		stage => 4,
		service_state => $service_state
	}
}

node 'vbaby6.cloud.eb' {
	
	# test for jdk
	#stage{1:}
	#class {'eb-jdk': stage => 1}

	# nomarl test
        stage{1:} -> stage{2:} -> stage{3:} -> stage{4:}
	class {'eb-jdk': stage => 1}
        class {'eb-hadoop': 
		stage => 2,
		service_state => $service_state
	}
        class {'eb-hadoop::namenode': 
		stage => 3,
		service_state => $service_state
	}
        class {'eb-hadoop::resourcemanager': 
		stage => 4,
		service_state => $service_state
	}
}
