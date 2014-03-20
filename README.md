puppet-util
===========

My Standard Library for Puppet Modules.

This module provides a "standard library" of resources for developing Puppet
Modules. This modules will include the following additions to Puppet:

 * chmod
 * chown
 * compress
 * extract

# Functions #

chmod
-----
Change the permission of file or directory.

*Examples:*
```puppet
util::chmod {'Changing permission for some file':
	file => '/some/file.txt',
	mode => 0644,
}
```
or
```puppet
util::chmod {'Changing permission for some directory':
	file => '/root',
	mode => 0700,
}
```
or
```puppet
util::chmod {'Changing permission for some directory recursively':
	file      => '/root',
	mode      => 0700,
	recursive => true, # default is "false"
}
```

chown
-----
Change the owner of file or directory.

*Examples:*
```puppet
util::chown {'Changing owner for some file':
	file => '/root/file.txt',
	user => 'root',
}
```
or
```puppet
util::chown {'Changing owner for some directory':
	file  => '/srv',
	user  => 'root',
	group => 'admin',
}
```
or
```puppet
util::chown {'Changing owner for some directory recursively':
	file      => '/root',
	user      => 'root',
	group     => 'admin',
	recursive => true,
}
```

compress
--------
Compres an file or directory.

The type of compression is determined for the file extension.

*Examples of compressing files:*
```puppet
util::compress {'Compressing some file with zip utility':
	from => '/tmp/vagrant-shell',
	to   => '/tmp/vagrant-shell.zip',
}
```
or
```puppet
util::compress {'Compressing some file with gzip utility':
	from => '/tmp/vagrant-shell',
	to   => '/tmp/vagrant-shell.gz',
}
```
or
```puppet
util::compress {'Compressing some file with bzip2 utility':
	from => '/tmp/vagrant-shell',
	to   => '/tmp/vagrant-shell.bz2',
}
```

*Examples of extracting files:*
```puppet
util::extract {'extracting some file with zip utility':
    from => '/tmp/vagrant-shell.zip',
    to   => '/root',
}
```
or
```puppet
util::extract {'extracting some file with gzip utility':
    from => '/tmp/vagrant-shell.gz',
    to   => '/root',
}
```
or
```puppet
util::extract {'extracting some file with bzip2 utility':
    from => '/tmp/vagrant-shell.bz2',
    to   => '/root',
}
```

# Contact #

Principal developer:
	[Leonardo Thibes](http://leonardothibes.com) => [eu@leonardothibes.com](mailto:eu@leonardothibes.com)

# Support #

Please log tickets and issues at our [Projects site](https://github.com/leonardothibes/puppet-util/issues)
