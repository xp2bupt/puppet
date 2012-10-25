#defination for creating dir recursively
#PARAM - method : 'install' or 'unintsll'

define eb-hadoop::createdir
(
	$owner = udef,
	$group = udef,
	$mode  = udef,
	$method = udef
){
	exec {"mkdir -p ${name}": 
		command => "mkdir -p ${name}",
		creates => $name,
		path => ["/usr/bin", "/usr/sbin","/bin/"]
	}

	if ($method == 'install'){
		$ensure = present		
	} elsif ($method == 'uninstall'){
		$ensure = absent
	}
	
	file {$name :
		ensure => $ensure,
		owner  => $owner,
		group  => $group,
		mode   => $mode
	}

	Exec["mkdir -p ${name}"] -> File[$name]
}

