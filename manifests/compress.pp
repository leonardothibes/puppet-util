define util::compress($from = $title, $to)
{
	$ext = get_extension($to)
	case $ext {
		'zip': {
			util::compressor::zip::compress {$title:
				from => $from,
				to   => $to,
			}
		}
		default: {
			fail("Unsupported extension: ${ext}")
		}
	}
}
