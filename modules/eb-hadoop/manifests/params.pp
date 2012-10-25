class eb-hadoop::params {
	#env params
	
	include eb-jdk::params

	$HADOOP_PREFIX="/usr/lib/hadoop-2.0.1-alpha"	
	$PATH="\$PATH:${HADOOP_PREFIX}/bin:${HADOOP_PREFIX}/sbin"
	#TODO
	$JAVA_HOME="\$JAVA_HOME"

	#server params
	$HADOOP_NAMENODE_HOST="vbaby6"
	$HADOOP_RESOURCEMANAGER_HOST="vbaby6"
	$HADOOP_JOBHISTORY_HOST="vbaby6"

	#hadoop home params
	$HADOOP_COMMON_HOME="${HADOOP_PREFIX}"
	$HADOOP_MAPRED_HOME="${HADOOP_PREFIX}"
	$HADOOP_HDFS_HOME="${HADOOP_PREFIX}"
	$YARN_HOME="${HADOOP_PREFIX}"

	#hadoop log params
	$HADOOP_LOG_DIR="/var/log/hadoop-log"
	$YARN_LOG_DIR="/var/log/yarn-log"

	#hadoop conf params
	$HADOOP_CONF_DIR="${HADOOP_PREFIX}/etc/hadoop"
	$YARN_CONF_DIR="${HADOOP_PREFIX}/etc/hadoop"


	#hdfs(hdfs-site.xml)
	$DFS_NAMENODE_NAME_DIR="/data/namenode"
	$DFS_DATANODE_DATA_DIR="/data/datanode"
	
	#yarn(yarn-site.xml)
	$YARN_NODEMANAGER_LOCAL_DIRS="/data/yarn/local"
	$YARN_NODEMANAGER_LOG_DIRS="/data/yarn/logs"
	$YARN_STAGING_DIRS="/user"

	#conf  
	$HADOOP_PROFILE_FILE="hadoop-profile.sh"
}
