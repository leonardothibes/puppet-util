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
	file => '/srv',
	user => 'adm',
}
```

chgrp
-----
Change the group of file or directory.

*Examples:*
```puppet
util::chgrp {'Changing group for some file':
	file  => '/root/file.txt',
	group => 'root',
}
```
or
```puppet
util::chgrp {'Changing group for some directory':
	file  => '/srv',
	group => 'admin',
}
```

# Contact #

Principal developer:
	[Leonardo Thibes](http://leonardothibes.com) => [eu@leonardothibes.com](mailto:eu@leonardothibes.com)

# Support #

Please log tickets and issues at our [Projects site](https://github.com/leonardothibes/puppet-util/issues)
