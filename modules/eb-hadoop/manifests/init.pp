class eb-hadoop 
(
	$service_state = 'run'
)
{

	include eb-hadoop::params	

    if ($service_state == 'install'){
	

	Eb-hadoop::Package<||>{method => 'tar'}
	
	eb-hadoop::package{'hadoop':}

	# *-site.xml
	# TODO can use a defination to declare all the resource
	eb-hadoop::configfile{"core-site.xml":
		ensure => present ,
		owner  => 'root' ,
		group  => 'root' ,
		mode   =>  0777  ,
		path   => $eb-hadoop::params::HADOOP_CONF_DIR
	}
	
	eb-hadoop::configfile{"hdfs-site.xml":
		ensure => present ,
		owner  => 'root' ,
		group  => 'root' ,
		mode   => 0777   ,
		path   => $eb-hadoop::params::HADOOP_CONF_DIR
	}

	eb-hadoop::configfile{"mapred-site.xml":
		ensure => present ,
		owner  => 'root' ,
		group  => 'root' ,
		mode   => 0777   ,
		path   => $eb-hadoop::params::HADOOP_CONF_DIR
	}
	
	eb-hadoop::configfile{"yarn-site.xml":
		ensure => present ,
		owner  => 'root' ,
		group  => 'root' ,
		mode   => 0777   ,
		path   => $eb-hadoop::params::HADOOP_CONF_DIR
	}

	# *-env.sh
	eb-hadoop::configfile{"yarn-env.sh":
		ensure => present ,
		owner  => 'root' ,
		group  => 'root' ,
		mode   => 0777   ,
		path   => $eb-hadoop::params::HADOOP_CONF_DIR
	}
	
	eb-hadoop::configfile{"hadoop-env.sh":
		ensure => present ,
		owner  => 'root' ,
		group  => 'root' ,
		mode   => 0777   ,
		path   => $eb-hadoop::params::HADOOP_CONF_DIR
	}

	eb-hadoop::configfile{"slaves":
		ensure => present ,
		owner  => 'root' ,
		group  => 'root' ,
		mode   => 0777   ,
		path   => $eb-hadoop::params::HADOOP_CONF_DIR
	}

	# env params
	eb-hadoop::configfile{$eb-hadoop::params::HADOOP_PROFILE_FILE:
		ensure => present ,
		owner  => 'root'  ,
		group  => 'root'  ,
		mode   => 0777    ,
		path   => '/etc/profile.d'
	}	
	
	# make the env params take effect
	$ssh_command = "echo . /etc/profile.d/${eb-hadoop::params::HADOOP_PROFILE_FILE} >> /etc/profile"
	exec {$ssh_command:
		command => $ssh_command,
		path => ['/usr/bin','/usr/sbin','/bin'],
		onlyif => "test -f /etc/profile.d/${eb-hadoop::params::HADOOP_PROFILE_FILE}"
	}

	#create hadoop dir
	eb-hadoop::createdir{$eb-hadoop::params::HADOOP_LOG_DIR:
		owner => 'root',
		group => 'root',
		mode  => 0777,
		method => 'install'
	}

	eb-hadoop::createdir{$eb-hadoop::params::YARN_LOG_DIR:
		owner => 'root',
		group => 'root',
		mode  => 0777,
		method => 'install'
	}

	Eb-hadoop::Package['hadoop'] -> Eb-hadoop::Configfile<||> -> Exec[$ssh_command]  -> Eb-hadoop::Createdir<||>

   } elsif ($service_state == 'config') {

	# *-site.xml	
	eb-hadoop::configfile{"core-site.xml":
		ensure => present ,
		owner  => 'root' ,
		group  => 'root' ,
		mode   =>  0777  ,
		path   => $eb-hadoop::params::HADOOP_CONF_DIR
	}
	
	eb-hadoop::configfile{"hdfs-site.xml":
		ensure => present ,
		owner  => 'root' ,
		group  => 'root' ,
		mode   => 0777   ,
		path   => $eb-hadoop::params::HADOOP_CONF_DIR
	}

	eb-hadoop::configfile{"mapred-site.xml":
		ensure => present ,
		owner  => 'root' ,
		group  => 'root' ,
		mode   => 0777   ,
		path   => $eb-hadoop::params::HADOOP_CONF_DIR
	}
	
	eb-hadoop::configfile{"yarn-site.xml":
		ensure => present ,
		owner  => 'root' ,
		group  => 'root' ,
		mode   => 0777   ,
		path   => $eb-hadoop::params::HADOOP_CONF_DIR
	}

	# *-env.sh
	eb-hadoop::configfile{"yarn-env.sh":
		ensure => present ,
		owner  => 'root' ,
		group  => 'root' ,
		mode   => 0777   ,
		path   => $eb-hadoop::params::HADOOP_CONF_DIR
	}
	
	eb-hadoop::configfile{"hadoop-env.sh":
		ensure => present ,
		owner  => 'root' ,
		group  => 'root' ,
		mode   => 0777   ,
		path   => $eb-hadoop::params::HADOOP_CONF_DIR
	}

	eb-hadoop::configfile{"slaves":
		ensure => present ,
		owner  => 'root' ,
		group  => 'root' ,
		mode   => 0777   ,
		path   => $eb-hadoop::params::HADOOP_CONF_DIR
	}

   }
}
