# USAGE : defination for operating hadoop . Start or Stop hadoop
# PARAM - ensure : running or stopp
# PARAM - method : operating hadoop with cmd or service, 2 kinds of methods

define eb-hadoop::service (
	$ensure = 'running',
)
{	
	anchor{"eb-hadoop::service::begin": }
	anchor{"eb-hadoop::service::end": }


	#TODO add this param to params.pp
	$hadoop_daemon_sh = "${eb-hadoop::params::HADOOP_PREFIX}/hadoop-daemon.sh"	
	$hadoop_conf_dir = $eb-hadoop::params::HADOOP_CONF_DIR

	if (ensure == 'running') {
		$cmd = "${hadoop_daemon_sh} --config ${hadoop_conf_dir} start ${name}" 
	} elsif (ensure == 'stopped') {
		$cmd = "${hadoop_daemon_sh} --config ${hadoop_conf_dir} stop ${name}" 
	} else {
	}

	exec {$cmd :
		command => cmd,
	}

	Anchor["eb-hadoop::service::begin"] -> Exec["cmd"] -> Anchor["eb-hadoop::service::end"]
}
