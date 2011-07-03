#!/usr/bin/env ruby

# 
# Haulage 
# Source code dependency manager.
# Copyright (c) 2011 Sam Saint-Pettersen.
#
# Released under the MIT/X11 License.
#
require 'optparse'
require './haul'

# Globals
$version = '1.0'

def main()
	options = {}
	optparse = OptionParser.new do|opts|
		# Set banner, displayed at the top of help screen.
		opts.banner = "Usage: #{$0} [-h|-v][--silent --pull|--push FILE.DEPS]"

		# Define the options and what they do.
		opts.on('-h', '--help', 'Display this information and exit.') do
			showInfo()
			puts opts
			puts "\n"
			exit
		end
		opts.on('-v', '--version', 'Display version information and exit.') do
			showVersion()
		end
		options[:quiet] = false
		opts.on('-s', '--silent', 'Perform the task silenty. (No output).') do
			options[:quiet] = true
		end
		options[:pull] = nil
		opts.on('-p', '--pull FILE.DEPS', 'Pull dependencies from FILE.DEPS.') do|file|
			options[:pull] = file
			pullDeps(options[:pull])
		end
		options[:push] = nil
		opts.on('-q', '--push FILE.DEPS', 'Push dependencies from FILE.DEPS to db.') do|file|
			options[:push] = file
			pushDeps(options[:push])
		end
	end
	# Parse arguments and remove them from ARGV array
	begin
		optparse.parse!
	rescue
		throwError("Invalid options specified")
	end
end

def pullDeps(depfile)
	if isFile(depfile)
		r = Haul.pull(depfile)
	else
		badFile(depfile)
	end
end

def pushDeps(depfile)
	if isFile(depfile)
		r = Haul.push(depfile)
	else 
		badFile(depfile)
	end
end

def badFile(depfile)
	throwError("Invalid file - #{depfile}")
end

def throwError(msg) 
	puts "Error: #{msg}."
	showInfo()
	puts "Use '#{$0} -h' for usage.\n\n"
	exit
end

def isFile(depfile)
	return File.file? depfile
end

def showInfo()
	puts "\nHaulage"
	puts "Source code dependency manager."
	puts "Copyright (c) 2011 Sam Saint-Pettersen."
	puts "\nReleased under the MIT/X11 License.\n\n"
end

def showVersion() 
	puts "Haulage version #{$version} (haul module v.#{Haul.version})\n"
	exit
end

main()
