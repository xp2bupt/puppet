class eb-hadoop::namenode {

	include eb-hadoop::params

	eb-hadoop::createdir{$eb-hadoop::params::DFS_NAMENODE_NAME_DIR:
		owner => 'root',
		group => 'root',
		mode  => 0777,
		method => 'install'
	}	
	
	class {'eb-hadoop::namenode::format':}	
	
	#eb-hadoop::service{'namenode':}
	
	#Eb-hadoop::Createdir[$eb-hadoop::params::DFS_NAMENODE_NAME_DIR] -> Class['eb-hadoop::namenode::format'] -> Eb-hadoop::Service['namenode']
	Eb-hadoop::Createdir[$eb-hadoop::params::DFS_NAMENODE_NAME_DIR] -> Class['eb-hadoop::namenode::format']


}
