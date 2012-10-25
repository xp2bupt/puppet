class eb-jdk
{
	include eb-jdk::params
	
	file {"/root/${eb-jdk::params::JDK_INSTALL_FILE}":
		ensure => present ,
		owner => 'root' ,
		group => 'root' ,
		mode => 0777 ,
		source => "puppet:///modules/eb-jdk/${eb-jdk::params::JDK_INSTALL_FILE}"
	}

	exec {"tar -zxvf /root/${eb-jdk::params::JDK_INSTALL_FILE}":
		cwd  => "/usr/lib/jvm",
		path => ["/usr/bin", "/usr/sbin","/bin/"],
		timeout => 3600,
		user => 'root',
		group => 'root'
	}
	
	File["/root/${eb-jdk::params::JDK_INSTALL_FILE}"] -> Exec["tar -zxvf /root/${eb-jdk::params::JDK_INSTALL_FILE}"]
}
