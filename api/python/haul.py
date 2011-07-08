# 
# Haul module [for Python code].
# Haulage source code manager.
# Copyright (c) 2011 Sam Saint-Pettersen.
#
# Released under the MIT/X11 License.
#
from subprocess import Popen, PIPE, STDOUT

# Globals
haul = None
rubyexec = 'ruby'

def init():
	global haul
	print "Initialized haul module."
	haul = Popen([rubyexec, 'haulapi.rb'], stdin=PIPE, stdout=PIPE, stderr=STDOUT)

def version():
	out = __callHaul('version()')
	print out[0]

def pull(depfile='haul.deps', quiet=False):
	out = __callHaul('pull(\'{0}\', false)'.format(depfile))
	if not quiet:
		for o in out:
			print o

def push(depfile='haul.deps', quiet=False):
	out = __callHaul('push(\'{0}\', false)'.format(depfile))
	if not quiet:
		print out

def __callHaul(method):
	haul.stdin.write("Haul.{0}".format(method))
	result = []
	while True:
		if haul.poll() is not None:
			print 'An error occured in haul.'
			exit(0)

		# Read one line, removing newline characters and trailing spaces.
		line = haul.stdout.readline().rstrip()
		if line == '[end]':
			break
		result.append(line)
	return result
