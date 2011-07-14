#!/bin/bash
#
# Haul module [for Bash shell].
# Haulage source code manager.
# Copyright (c) 2011 Sam Saint-Pettersen.
#
# Released under the MIT/X11 License.
#

# globals
quiet=false

function init {
	echo "Initialized haul module."
}

function version {
	__callHaul "version()"
}

function pull {
	quiet = $2
	__callHaul "pull('$1', false)"
}

function push {
	quiet = $2
	__callHaul "push('$1', false)"
}

function __callHaul {
	echo "Haul.$1" | haulapi.rb
}

case $1 in
init)
	init
	;;
version)
	version
	;;
pull)
	pull $2 $3
	;;
push)
	push $2 $3
	;;
esac
