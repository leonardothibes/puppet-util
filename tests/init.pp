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
util::chmod {'Changing permission for some directory':
    file      => '/root',
    mode      => 0755,
	recursive => false,
}

util::chown {'Changing owner for some file':
    file  => '/tmp/vagrant-shell',
    user  => 'root',
	group => 'admin',
}

util::chown {'Changing owner for some directory':
    file      => '/root',
    user      => 'root',
	group     => 'admin',
	recursive => true,
}

util::compress {'Compressing some file with zip utility':
	from => '/etc/hosts',
	to   => '/root/hosts.zip',
}

#util::uncompress {'Uncompressing some file with zip utility':
#	from => '/tmp/vagrant-shell.zip',
#	to   => '/root',
#}

util::compress {'Compressing some file with gzip utility':
	from => '/etc/hosts',
	to   => '/root/hosts.gz',
}

util::compress {'Compressing some file with bzips utility':
	from => '/etc/hosts',
	to   => '/root/hosts.bz2',
}

util::compress {'Compressing some directory with zip utility':
	from => '/etc/vim',
	to   => '/root/vim.zip',
}

util::compress {'Compressing some directory with gzip utility':
	from => '/etc/vim',
	to   => '/root/vim.tar.gz',
}

util::compress {'Compressing some directory with bzip2 utility':
	from => '/etc/vim',
	to   => '/root/vim.tar.bz2',
}
