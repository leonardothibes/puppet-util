define util::uncompress($from = $title, $to)
{
	$ext = get_extension($from)
	case $ext {
		'zip': {
			util::compressor::zip::uncompress {$title:
				from => $from,
				to   => $to,
			}
		}
		default: {
			fail("Unsupported extension: ${ext}")
		}
	}
}
