module Puppet::Parser::Functions
	newfunction(:is_dir, :type => :rvalue) do |args|
		return File.basename(args[0])
	end
end
