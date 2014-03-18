puppet-util
===========

My Standard Library for Puppet Modules.

This module provides a "standard library" of resources for developing Puppet
Modules. This modules will include the following additions to Puppet

 * chmod
 * chown
 * chgrp

# Functions #

chmod
-----
Change the permission of  file or directory.

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


# Contact #

Principal developer:
	[Leonardo Thibes](http://leonardothibes.com) => [eu@leonardothibes.com](mailto:eu@leonardothibes.com)

# Support #

Please log tickets and issues at our [Projects site](https://github.com/leonardothibes/puppet-util/issues)
