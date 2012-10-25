# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# User for YARN daemons

export HADOOP_YARN_USER=${HADOOP_YARN_USER:-yarn}



#export JAVA_HOME=/usr/lib/jvm/java-1.6.0-sun-1.6.0.30.x86_64
export JAVA_HOME=/usr/lib/jvm/jdk1.7.0_06

export HADOOP_PREFIX=/usr/lib/hadoop-2.0.1-alpha

export HADOOP_LOG_DIR=/var/log/hadoop-log
export YARN_LOG_DIR=/var/log/yarn-log


export PATH=$PATH:$HADOOP_PREFIX/bin
export PATH=$PATH:$HADOOP_PREFIX/sbin
export HADOOP_MAPRED_HOME="${HADOOP_PREFIX}"
export HADOOP_HDFS_HOME="${HADOOP_PREFIX}"
export YARN_HOME="${HADOOP_PREFIX}"
export HADOOP_COMMON_HOME=${HADOOP_PREFIX}
export HADOOP_CONF_DIR="${HADOOP_PREFIX}"/etc/hadoop
export YARN_CONF_DIR=$HADOOP_CONF_DIR


#export MALLOC_ARENA_MAX="4"


