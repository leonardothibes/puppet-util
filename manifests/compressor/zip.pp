class util::compressor::zip
{
	define install()
	{
		$zip = 'util::compressor::zip'
		if !defined(Package[$zip]) {
			package {$zip:
				ensure => present,
				name   => ['zip','unzip'],
			}
		}
	}

	define compress($from = $title, $to)
	{
		include util::params
		$resource = "util::compressor::zip::compress::${title}"
		util::compressor::zip::install {"Installing Zip Packages From ${title}":
			before => Exec[$resource],
		}
		exec {$resource:
			path    => $util::params::envpath,
			command => "zip -r ${to} ${from}",
			onlyif  => "[ ! -f ${to} ] && [ ! -d ${to} ]",
		}
	}

	define uncompress($from = $title, $to)
	{
		include util::params
		$resource = "util::compressor::zip::compress::${title}"
		util::compressor::zip::install {"Installing Zip Packages From ${title}":
			before => Exec[$resource],
		}
		exec {$resource:
			path    => $util::params::envpath,
			command => "unzip -d . ${from}",
			cwd     => $to,
			onlyif  => "[ -d ${to} ]",
			returns => ['0','1'],
		}
	}
}
