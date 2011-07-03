# 
# Haul module.
# Haulage source code manager.
# Copyright (c) 2011 Sam Saint-Pettersen.
#
# Released under the MIT/X11 License.
#
require 'rubygems'
require 'json'
require 'net/http'
require 'mongo'

# Globals
$version = '1.0'
$depfile = nil

# Database access configuration
# Temporary. This will be recorded to a config file.
DB_NAME = 'haulage_deps_db'
DB_USER = 'haulage_agent'
DB_PWD = '<encrypted pwd>'

module Haul
	def self.version()
		return $version
	end
	def self.pull(depfile)
		self.parseDeps(depfile)
		puts "Pulling dependencies defined in #{depfile}..."
		return depfile
	end
	def self.push(depfile)
		self.parseDeps(depfile)
		puts "Pushing dependencies defined in #{depfile}..."
		return depfile
	end
	private
	def self.parseDeps(depfile) 
		$deps = depfile
	end
	def self.pullOverHttp()
		Net::HTTP.start(url) { |http|
			resp = http.get(dlUrl)
			open(dlFile, 'wb') { |file|
				file.write(resp.body)
			}
		}
		puts "Retrieved \"#{dlFile}\" via Http."
	end
	def self.pullOverAptGet()
		system("sudo apt-get install #{dlFile}")
		puts "Retrieved \"#{dlFile}\" via Apt-Get."
	end
	def self.connectToDB()
		#...
	end
end
