module Puppet::Parser::Functions
	newfunction(:path, :type => :rvalue) do |args|
		return File.path(args[0])
	end
end
