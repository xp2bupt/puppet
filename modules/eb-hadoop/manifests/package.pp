#USEAGE : installing hadoop package by 2 ways - tar & rpm
#NOTICE : singleton , not using class but define , so you can pass params

define eb-hadoop::package(
	$ensure = 'present' ,
	$method = undef
)
{
	if ($method == 'tar')
	{
		#file {'/root/hadoop-2.0.1-alpha.tar.gz':
		file {"/root/hadoop-2.0.1-alpha.tar.gz":
			ensure => present ,
			owner => 'root' ,
			group => 'root' ,
			mode => 0777 ,
			source => "puppet:///modules/eb-hadoop/hadoop-2.0.1-alpha.tar.gz"	
		}
		
		exec {'tar -zxvf /root/hadoop-2.0.1-alpha.tar.gz':
			cwd  => "/usr/lib/",
			path => ["/usr/bin", "/usr/sbin","/bin/"],
			timeout => 3600,
			user => 'root',
			group => 'root'
		}
		
		anchor{'eb-hadoop::package::begin':} -> File['/root/hadoop-2.0.1-alpha.tar.gz'] -> Exec['tar -zxvf /root/hadoop-2.0.1-alpha.tar.gz'] -> anchor{'eb-hadoop::package::end':}
	} 
}
