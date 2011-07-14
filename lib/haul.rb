# 
# Haul module.
# Haulage source code manager.
# Copyright (c) 2011 Sam Saint-Pettersen.
#
# Released under the MIT/X11 License.
#
require 'rubygems'
require 'json'
require 'open-uri'
require 'mongo'

# Globals
$version = '1.0'
$deps = []
$libdir = nil
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
		r = self.parseDeps(depfile, 1)
		return r

	end
	def self.push(depfile, quiet)
		$quiet = quiet
		if not $quiet
			puts "Pushing dependencies defined in #{depfile}..."
		end
		r = self.parseDeps(depfile, 2)
		return r
	end
	private
	def self.method_missing(method)
		puts "barfing sick!"
	end
	def self.parseDeps(depfile, signal) 
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
			if signal == 1
				self.pullOverHttp()
			elsif signal == 2
				self.pushToDB()
			else
				if not $quiet
					puts "Skipping dependency: #{deps[0]['file']}..."
				end
			end
			c = c + 1
		end
		return true
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
	def self.pushToDB()
		#...
	end
	def self.performChecks()
		return 'an array'
	end
	def self.detectSystem()
		return 'an os family'
	end
	def self.checkExists(file, type)
		return false
	end
end
