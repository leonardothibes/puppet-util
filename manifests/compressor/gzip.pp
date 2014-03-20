class util::compressor::gzip
{
	define install()
	{
		$gzip = 'util::compressor::gzip'
		if !defined(Package[$gzip]) {
			package {$gzip:
				ensure => present,
				name   => ['gzip','tar'],
			}
		}
	}

	define compress($from = $title, $to)
	{
		include util::params
		util::compressor::gzip::install {"Installing Gzip Packages From ${title}":}
		
		if is_dir($from) {


			$path     = path($to)
			$basename = basename($to)

			exec {"util::compressor::gzip::copy::${title}":
				path    => $util::params::envpath,
				command => "cp -Rf ${from} ${path}",
				before  => Exec["util::compressor::gzip::compress::${title}"],
			}


			exec {"util::compressor::gzip::compress::${title}":
				path    => $util::params::envpath,
				command => "tar -zcf ${basename} ${from}",
				cwd     => $path,
				onlyif  => "[ ! -f ${to} ]",
			}

			#exec {"util::compressor::gzip::clean::${title}":
			#	path    => $util::params::envpath,
			#	command => "rm -Rf ${basename}",
			#	cwd     => $path,
			#}

		} else {
		$path     = path($to)
		$basename = basename($from)
			exec {"util::compressor::gzip::copy::${title}":
				path    => $util::params::envpath,
				command => "cp -f ${from} ${path}",
				before  => Exec["util::compressor::gzip::compress::${title}"],
			}
			exec {"util::compressor::gzip::compress::${title}":
				path    => $util::params::envpath,
				command => "gzip ${basename}",
				cwd     => $path,
				onlyif  => "[ ! -f ${to} ]",
			}
		}
	}

	define uncompress($from = $title, $to)
	{
		include util::params
		$resource = "util::compressor::gzip::compress::${title}"
		util::compressor::gzip::install {"Installing Gzip Packages From ${title}":
			before => Exec[$resource],
		}
		exec {$resource:
			path    => $util::params::envpath,
			command => "ungzip -d . ${from}",
			cwd     => $to,
			onlyif  => "[ -d ${to} ]",
			returns => ['0','1'],
		}
	}
}
