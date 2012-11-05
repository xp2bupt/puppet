class eb-hadoop::namenode::format 
(
	$force = true	
)
{
	if ($force == true) {
		exec {"/usr/lib/hadoop-2.0.1-alpha/bin/hdfs namenode -format":
			command => '/usr/lib/hadoop-2.0.1-alpha/bin/hdfs namenode -format',
			path => ["/usr/bin", "/usr/sbin","/bin/"],
			timeout => 120,
			provider => shell,
		}
	} else {
	}
	
}
