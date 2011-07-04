# 
# Haul module.N/A
# Haulage source code manager.
# Copyright (c) 2011 Sam Saint-Pettersen.
#
# Released under the MIT/X11 License.
#
require 'rubygems'
require 'json'
require 'hashie/hash'
require 'open-uri'
require 'mongo'

# Globals
$version = '1.0'
$deps = []

# Database access configuration
# Temporary. This will be recorded to a config file.
DB_NAME = 'haulage_deps_db'
DB_USER = 'haulage_agent'
DB_PWD = '<encrypted pwd>'

module Haul
	def self.version()
		return $version
	end
	def self.pull(depfile, quiet)
		puts "Pulling dependencies defined in #{depfile}..."
		self.parseDeps(depfile)
		#self.pullOverHttp()
		self.pullOverAptGet()
	end
	def self.push(depfile, quiet)
		puts "Pushing dependencies defined in #{depfile}..."
		self.parseDeps(depfile)
		self.pushToDB()
	end
	private
	def self.parseDeps(depfile) 
		json = File.read(depfile)
		deps = JSON.parse(json)
		$deps = deps['dependency1']
	end
	def self.pullOverHttp()
		dlfile = open("#{$deps[0]['file']}", 'wb')
		dlfile.write(open("#{$deps[1]['http-get']}").read)
		dlfile.close
		puts "Retrieved \"#{$deps[0]['file']}\" via Http."
	end
	def self.pullOverAptGet()
		system("sudo apt-get install #{$deps[2]['apt-get']}")
		puts "Retrieved \"#{$deps[0]['file']}\" via Apt-Get."
	end
	def self.pushToDB()
		#...
	end
end
