require 'rubygems'
require 'rake'
require 'echoe'
require 'fileutils'

name = 'haul'
version = '1.0'
Echoe.new(name, version) do |p|
	p.description = "Haulage source code manager."
	p.url	      = "http://stpettersens.github.com/Haulage"		
	p.email	      = "s.stpettersen@gmail.com"
	p.ignore_pattern	= ["api/*"]
	p.development_dependencies = []
	p.runtime_dependencies = ["json","mongo", "bson_ext", "sys-uname", "whereis"]
end

task :makegem => [:build_gemspec] do
	puts "Building gem..."
	system("gem build #{name}.gemspec")
end

task :instgem, :env do |t, args|
	puts "Installing gem to #{args.env}..."
	system("#{args.env} -S gem install #{name}-#{version}")
end

task :all => [:makegem, :instgem, :cleanup] do
end

task :cleanup => [:clobber] do
	puts "Removing everything, including .gemspec"
	FileUtils.rm("Manifest")
	FileUtils.rm("#{name}.gemspec")
end
