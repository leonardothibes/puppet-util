module Puppet::Parser::Functions
	newfunction(:path, :type => :rvalue) do |args|
		basename = File.basename(args[0])
		return args[0].gsub('/' + basename,'')
	end
end
