#
# Haul API module
# Utilize haul module with languages
# other than Ruby - e.g. Python or Perl.
#
# Code based on:
# http://www.decalage.info/python/ruby_bridge
#
require './haul'

# Read command from standard input.
while cmd = STDIN.gets
	# Remove whitespace.
	cmd.chomp!

	if cmd == "exit"
		break
	else
		# Evaluate command, send result to standard output.
		print eval(cmd), "\n"
		# Append [end] so that haul.xx module knows that is is the last line.
		print "[end]\n"
		# Flush STDOUT to avoid buffering issues.
		STDOUT.flush
	end
end
