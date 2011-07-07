require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('haul', '1.0.1') do |p|
	p.description		= "Haulage source code manager."
	p.url			= "http://stpettersens.github.com/Haulage"		
	p.email			= "s.stpettersen@gmail.com"
	p.ignore_pattern	= ["bin/*", "api/*", "tmp/*", "script/*"]
	p.development_dependencies = []
end

# Include other rakefiles...
Dir.glob('tasks/*.rake').each { |r| import r }
