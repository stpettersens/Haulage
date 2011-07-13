# 
# Haul module [for Perl code].
# Haulage source code manager.
# Copyright (c) 2011 Sam Saint-Pettersen.
#
# Released under the MIT/X11 License.
#
# TODO: Need to make this a proper Perl module.
use strict;
use warnings;

# Globals
my $rubyexec = 'ruby';

sub init {
	print "Initialized haul module.\n";
}

sub version {
	my @out = __callHaul('version()');
	print $out[0];
}

sub pull {
	my @out = __callHaul("pull(\"$_[0]\", false)");
	if($_[1] == 0) {
		my $i = 0;
		my $num = @out;
		while($i < $num - 1) {
			print $out[$i];
			$i = $i + 1;
		}
	}
}

sub push {
	my @out = __callHaul("push(\"$_[0]\", false)");
	if($_[1] == 0) {
		my $i = 0;
		my $num = @out;
		while($i < $num - 1) {
			print $out[$i];
			$i = $i + 1;
		}
	}
}

sub __callHaul {
	my $temp = 'haul.txt';
	my @result;
	open OUTPUT, "| $rubyexec haulapi.rb > $temp" || die $!;
	print OUTPUT "Haul.$_[0]";
	close OUTPUT;
	open FILE, $temp;
	my $line;
	foreach $line (<FILE>) {
		push(@result, $line);
	}
	close FILE;
	unlink $temp;
	return @result;
}
