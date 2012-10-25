class sudo {
	file {"/root/1.txt":
			source => "puppet:///modules/sudo/1.txt"
		}
}
