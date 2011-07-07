#
# Complimentory rakefile to assist ../Rakefile.
#
require 'fileutils'

task :cleanup => [:clobber]  do
	puts "Removing everything, including .gemspec."
	FileUtils.rm("haul.gemspec")
end

