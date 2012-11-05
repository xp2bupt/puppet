class eb-hadoop::resourcemanager
(
	$service_state = 'run',
)
{
	if ($service_state == 'run' or $service_state == 'stop'){
		eb-hadoop::service {'resourcemanager':
			service_state => $service_state 
		}	
	}
}
