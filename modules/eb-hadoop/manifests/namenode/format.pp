class eb-hadoop::namenode::format 
(
	$force = true	
)
{
	if (force == true) {
		exec {"hdfs namenode>/tmp/hdfs":
			command => 'hdfs namenode>/tmp/hdfs',
			path => $eb-hadoop::params::PATH,
			timeout => 3600
		}
	} else {
	}
}
