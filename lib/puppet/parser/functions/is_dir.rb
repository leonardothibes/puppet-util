module Puppet::Parser::Functions
	newfunction(:is_dir, :type => :rvalue) do |args|
		return File.directory?(args[0])
	end
end
