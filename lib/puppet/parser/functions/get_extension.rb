module Puppet::Parser::Functions
	newfunction(:get_extension, :type => :rvalue) do |args|
		extension = File.extname(args[0])
		return extension.gsub('.','')
	end
end
