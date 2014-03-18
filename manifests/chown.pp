define util::chown(
	$file      = $title, # Title of puppet resource
	$user      = 'root', # User name
	$group     = 'root', # Group name
	$recursive = false,  # Applicable only for directories
) {   
	include util
	$params = $recursive ? {
		true  => ' -Rf',
		false => '',
	}
	exec {"util::chown::${file}":
		path    => $util::envpath,
		command => "chown${params} ${user} ${file}",
		onlyif  => "[ -f ${file} ] || [ -d ${file} ]",
	}
	exec {"util::chgrp::${file}":
		path    => $util::envpath,
		command => "chgrp${params} ${group} ${file}",
		onlyif  => "[ -f ${file} ] || [ -d ${file} ]",
	}
}
