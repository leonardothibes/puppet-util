module Puppet::Parser::Functions
	newfunction(:basename, :type => :rvalue) do |args|
		return File.basename(args[0])
	end
end
