module Puppet::Parser::Functions
	newfunction(:get_extension, :type => :rvalue) do |args|
		name = File.basename(args[0])
		ext  = name.split('.')
		ext.shift
		if ext[1] == nil
			return ext[0]
		else
			return ext.join('.')
		end
	end
end
