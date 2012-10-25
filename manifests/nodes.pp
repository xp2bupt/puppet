node 'vbaby2.cloud.eb' {
	stage{1:} -> stage{2:} -> stage{3:} -> stage{4:}

	class {'eb-jdk': stage => 1}
	class {'eb-hadoop': stage => 2}
	class {'eb-hadoop::datanode': stage => 3}
	class {'eb-hadoop::nodemanager': stage => 4}
}

node 'vbaby4.cloud.eb' {

        stage{1:} -> stage{2:} -> stage{3:} -> stage{4:}

	class {'eb-jdk': stage => 1}
        class {'eb-hadoop': stage => 2}
        class {'eb-hadoop::datanode': stage => 3}
        class {'eb-hadoop::nodemanager': stage => 4}
}

node 'vbaby5.cloud.eb' {

        stage{1:} -> stage{2:} -> stage{3:} -> stage{4:}

	class {'eb-jdk': stage => 1}
        class {'eb-hadoop': stage => 2}
        class {'eb-hadoop::datanode': stage => 3}
        class {'eb-hadoop::nodemanager': stage => 4}
}

node 'vbaby6.cloud.eb' {

        stage{1:} -> stage{2:} -> stage{3:} -> stage{4:}

	class {'eb-jdk': stage => 1}
        class {'eb-hadoop': stage => 2}
        class {'eb-hadoop::namenode': stage => 3}
        class {'eb-hadoop::resourcemanager': stage => 4}
}
