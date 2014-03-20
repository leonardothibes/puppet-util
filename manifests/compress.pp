define util::compress($from = $title, $to)
{
	include util::params
	include util::dependencies
	
	$compress  = basename($from)
	$basename  = basename($to)
	$extension = get_extension($to)
	$target    = path($to)

	if is_dir($from) {
		$middle = $extension ? {
			'zip'            => "zip -r ${basename} ${compress}",
			/(tar.gz|tgz)/   => "tar -zcf ${basename} ${compress}",
			/(tar.bz2|tbz2)/ => "tar -jcf ${basename} ${compress}",
			default          => false,
		}
	} else {
		$middle = $extension ? {
			'zip'   => "zip -r ${basename} ${compress}",
			'gz'    => "gzip ${compress}",
			'bz2'   => "bzip2 ${compress}",
			default => false,
		}
	}
	if $middle == false {
		fail("Unknown extension value: \"${extension}\"")
	}

	$begin   = "cp -Rf ${from} . && "
	$end     = " && rm -Rf ${compress}"
	$command = "${begin}${middle}${end}"
	
	exec {"util::compress::${from}::to::${to}":
		path    => $util::params::envpath,
		command => $command,
		onlyif  => "[ ! -f ${basename} ]",
		cwd     => $target,
	}
}
