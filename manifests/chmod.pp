define util::chmod(
	$file      = $title, # Title of puppet resource
	$mode      = 755,    # chmod number
	$recursive = false,  # Applicable only for directories
) {   
	include util
	$command  = $recursive ? {
		true  => 'chmod -Rf',
		false => 'chmod',
	}
	exec {"util::chmod::${file}":
		path    => $util::envpath,
		command => "${command} ${mode} ${file}",
		onlyif  => "[ -f ${file} ] || [ -d ${file} ]",
	}   
}
