class eb-hadoop::datanode {
	
	include eb-hadoop::params

	eb-hadoop::createdir{$eb-hadoop::params::DFS_DATANODE_DATA_DIR:
		owner => 'root',
		group => 'root',
		mode  => 0777,
		method => 'install'
	}	

}
