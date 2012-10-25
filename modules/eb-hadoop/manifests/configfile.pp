define eb-hadoop::configfile 
(
	$ensure = present,
	$owner = udef,
	$group = udef,
	$mode = udef,
	$path = udef
)
{
	
	$filename = "${path}/${name}"
#TODO
	$realnames = split($name, '[.]') 
	$realname = $realnames[0]
	$template_name = "eb-hadoop/${realname}.erb"

	file {$filename : 
		ensure => $ensure,
		owner  => $owner,
		group  => $group,
		mode   => $mode,
		content => template($template_name)
	}
}
