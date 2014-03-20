## The baseline for module testing used by Puppet Labs is that each manifest
## should have a corresponding test manifest that declares that class or defined
## type.
##
## Tests are then run by using puppet apply --noop (to check for compilation
## errors and view a log of events) or by fully applying the test in a virtual
## environment (to compare the resulting system state to the desired state).
##
## Learn more about module testing here:
## http://docs.puppetlabs.com/guides/tests_smoke.html
##
#util::chmod {'Changing permission for some file':
#    file => '/tmp/vagrant-shell',
#    mode => 0755,
#}
#
#util::chmod {'Changing permission for some directory':
#    file      => '/root',
#    mode      => 0755,
#	recursive => false,
#}
#
#util::chown {'Changing owner for some file':
#    file  => '/tmp/vagrant-shell',
#    user  => 'root',
#	group => 'admin',
#}
#
#util::chown {'Changing owner for some directory':
#    file      => '/root',
#    user      => 'root',
#	group     => 'admin',
#	recursive => true,
#}
#
#util::compress {'Compressing some file with zip utility':
#	from => '/tmp/vagrant-shell',
#	to   => '/tmp/vagrant-shell.zip',
#}
#
#util::uncompress {'Uncompressing some file with zip utility':
#	from => '/tmp/vagrant-shell.zip',
#	to   => '/root',
#}
#
#util::compress {'Compressing some directory with zip utility':
#	from => '/etc',
#	to   => '/root/etc.zip',
#}
#
#util::uncompress {'Uncompressing some directory with zip utility':
#	from => '/root/etc.zip',
#	to   => '/tmp',
#}
#
#util::compress {'Compressing some file with gzip utility':
#	from => '/tmp/vagrant-shell',
#	to   => '/root/vagrant-shell.gz',
#}
#
util::compress {'Compressing some directory with gzip utility':
	from => '/etc/vim',
	to   => '/root/vim.tar.gz',
}
