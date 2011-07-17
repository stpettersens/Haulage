# 
# Haul module.
# Haulage source code manager.
# Copyright (c) 2011 Sam Saint-Pettersen.
#
# Released under the MIT/X11 License.
#
require 'json'
require 'open-uri'
require 'mongo'
require 'sys/uname'
require 'whereis'
include Sys

# Globals
$version = '1.0'
$deps = []
$quiet = false

module Haul
	def self.version()
		return "haul module v. #{$version}."
	end
	def self.pull(depfile, quiet)
		$quiet = quiet
		if not $quiet
			puts "Pulling dependencies defined in #{depfile}..."
		end
		self.parseDeps(depfile, 1.0)
	end
	def self.push(depfile, quiet)
		$quiet = quiet
		if not $quiet
			puts "Pushing dependencies defined in #{depfile}..."
		end
		self.parseDeps(depfile, 2.0)
	end
	private
	def self.parseDeps(depfile) 
		json = File.read(depfile)
		parsed = JSON.parse(json)
		preamble = parsed['preamble']
		count = preamble[0]['count'].to_i
		if not $quiet
			puts "Requesting #{count} dependencies..."
		end
		c = 1
		while c <= count
			index = "dependency#{c}"
			$deps = []
			$deps = parsed[index]
			signal, os = self.performChecks()
			signal case
			when 1.1
				self.pullOverHttp()
			when 1.2
				self.pullOverAptGet()
			when 1.3
				self.pullOverGems(os)
			when 2.0
				self.pushToDB()
			else
				if not $quiet
					puts "Skipping dependency: #{deps[0]['file']}..."
				end
			end
			c = c + 1
		end
	end
	def self.pullOverHttp()
		dlfile = open("#{$deps[0]['file']}", 'wb')
		dlfile.write(open("#{$deps[2]['http-get']}").read)
		dlfile.close
		if not $quiet
			puts "Retrieved \"#{$deps[0]['file']}\" via Http."
		end
	end
	def self.pullOverAptGet()
		system("sudo apt-get install #{$deps[3]['apt-get']}")
		if not $quiet
			puts "Retrieved \"#{$deps[0]['file']}\" via Apt-Get."
		end
	end
	def self.pullOverGems(os)
		sudo = ''
		if os.match(/.*n[i|u]x/)
			sudo = 'sudo'
		end
		system("#{sudo} gem install #{deps[4]['gem-get']}")
	end
	def self.pushToDB()
		#...
	end
	def self.performChecks()
		return 'an array'
	end
	def self.detectSystem()
		return Uname.sysname
	end
	def self.checkExists(file, type)
		if type == 'std'
			status = File.file? file
		elsif type == 'gem'
			#...
		elsif type == 'exec'
			status = Whereis.boolean(file)
		end
		return status
	end
end
