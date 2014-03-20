define util::compress($from = $title, $to)
{
	$ext = get_extension($to)
	case $ext {
		'zip','zp': {
			util::compressor::zip::compress {$title:
				from => $from,
				to   => $to,
			}
		}
		'gzip','gz','tgz': {
			util::compressor::gzip::compress {$title:
				from => $from,
				to   => $to,
			}
		}
		'bzip2','bz','bz2': {
			util::compressor::gzip::compress {$title:
				from => $from,
				to   => $to,
			}
		}
		default: {
			fail("Unsupported extension: ${ext}")
		}
	}
}
