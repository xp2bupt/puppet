# USAGE : defination for operating hadoop . Start or Stop hadoop
# PARAM - service_state : running or stopp
# PARAM - method : operating hadoop with cmd or service, 2 kinds of methods

define eb-hadoop::service (
	$service_state = 'run',
)
{	

	#TODO add this param to params.pp
	$hdfs_daemon_sh = "${eb-hadoop::params::HADOOP_PREFIX}/sbin/hadoop-daemon.sh"	
	$yarn_daemon_sh = "${eb-hadoop::params::HADOOP_PREFIX}/sbin/yarn-daemon.sh"
	$hadoop_conf_dir = $eb-hadoop::params::HADOOP_CONF_DIR
	
	if ($name == 'datanode' or $name == 'namenode'){
		$hadoop_daemon_sh = $hdfs_daemon_sh	
	} elsif ($name == 'nodemanager' or $name == 'resourcemanager'){
		$hadoop_daemon_sh = $yarn_daemon_sh
	}
	
	
	if ($service_state == 'run') {
		$cmd = "${hadoop_daemon_sh} --config ${hadoop_conf_dir} start ${name}" 
	} elsif ($service_state == 'stop') {
		$cmd = "${hadoop_daemon_sh} --config ${hadoop_conf_dir} stop ${name}" 
	} else {
	}

	notify {$cmd : }
	exec {$cmd :
		command => $cmd,
		user => 'root',
		group => 'root',
		path => ["/usr/bin", "/usr/sbin","/bin/"],
		provider => shell	
	}

	anchor{"eb-hadoop::service::${name}::begin":} -> Exec[$cmd] -> anchor{"eb-hadoop::service::${name}::end":}
}
