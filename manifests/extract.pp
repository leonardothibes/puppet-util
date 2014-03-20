define util::extract($from = $title, $to)
{
	include util::params
	include util::dependencies
	
	$extension = get_extension($from)
	$extract   = basename($from)

	if is_dir($to) {
		$args   = '--no-same-owner --no-same-permissions'
		$middle = $extension ? {
			/(tar.gz|tgz)/   => "tar -xzf ${args} ${extract}",
			/(tar.bz2|tbz2)/ => "tar -xjf ${args} ${extract}",
			/(gzip|gz)/      => "gunzip ${extract}",
			/(bzip2|bz2)/    => "bunzip2 ${extract}",
			'zip'            => "unzip ${extract}",
			default          => false,
		}
	} else {
		fail("Target needs to be a directory")
	}
	if $middle == false {
		fail("Unknown extension value: \"${extension}\"")
	}

	$begin   = "cp -Rf ${from} . && "
	$end     = " ; rm -Rf ${extract}"
	$command = "${begin}${middle}${end}"
	
	exec {"util::extract::${from}::to::${to}":
		path    => $util::params::envpath,
		command => $command,
		cwd     => $to,
		returns => ['0','1','2'],
	}
}
