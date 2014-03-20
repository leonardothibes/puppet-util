class util::dependencies inherits util::params
{
	$resource = 'util::dependencies::packages'
	if !defined(Package[$resource]) {
		package {$resource:
			ensure => present,
			name   => $util::dependencies::packages,
		}
	}
}
