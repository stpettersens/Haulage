# 
# Haul module [for Perl code].
# Haulage source code manager.
# Copyright (c) 2011 Sam Saint-Pettersen.
#
# Released under the MIT/X11 License.
#
use strict;
use warnings;

# Globals
my $haul;

sub init {
	print "Initialized haul module."
	open $haul, "| ruby haulapi.rb" || die "Error: Cannot run 'ruby haulapi.rb'";
}

sub version {
	my $out = callHaul('version()')
	print $out
}

sub callHaul {
	print $haul "Haul.$_0\n"
	my @result = ()
	while(<$haul>) {
		print $_;	
	}
	close $haul;
}
