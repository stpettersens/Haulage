require 'rubygems'
require 'rake'
require 'echoe'
require 'fileutils'

name = 'haul'
Echoe.new(name, '1.0.1') do |p|
	p.description		= "Haulage source code manager."
	p.url				= "http://stpettersens.github.com/Haulage"		
	p.email				= "s.stpettersen@gmail.com"
	p.ignore_pattern	= ["bin/*", "api/*"]
	p.development_dependencies = ["echoe", "rake >=1.9.0"]
	p.runtime_dependencies = []
end

task :makegem => [:build] do
	puts "Building gem..."
	system("gem build #{name}.gemspec")
end

task :cleanup => [:clobber] do
	puts "Removing everything, including .gemspec"
	FileUtils.rm("Manifest")
	FileUtils.rm("#{name}.gemspec")
end

# HOWTO include other rakefiles.
#Dir.glob('tasks/*.rake').each { |r| import r }
