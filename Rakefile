require 'rubygems'
require 'rake'
require 'echoe'
require 'fileutils'

name = 'haul'
Echoe.new(name, '1.0test2') do |p|
	p.description		= "Haulage source code manager."
	p.url				= "http://stpettersens.github.com/Haulage"		
	p.email				= "s.stpettersen@gmail.com"
	p.ignore_pattern	= ["api/*"]
	p.development_dependencies = ["echoe"]
	p.runtime_dependencies = ["json","mongo", "bson_ext"]
end

task :makegem => [:build_gemspec] do
	puts "Building gem..."
	system("gem build #{name}.gemspec")
end

task :cleanup => [:clobber] do
	puts "Removing everything, including .gemspec"
	FileUtils.rm("Manifest")
	FileUtils.rm("#{name}.gemspec")
end
