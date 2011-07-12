#!/bin/bash
#
# Haul module [for Bash shell].
# Haulage source code manager.
# Copyright (c) 2011 Sam Saint-Pettersen.
#
# Released under the MIT/X11 License.
#

ruby="ruby"

function init {
	echo "Initialized haul module."
}

function version {
	__callHaul "version()"
}

function pull {
	__callHaul "pull('$1', false)"
}

function __callHaul {
	echo "Haul.$1" | $ruby haulapi.rb
}

case $1 in
init)
	init
	;;
version)
	version
	;;
pull)
	pull $2
	;;
esac
