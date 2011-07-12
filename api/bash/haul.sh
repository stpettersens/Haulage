#!/bin/bash
#
# Haul module [for Bash shell].
# Haulage source code manager.
# Copyright (c) 2011 Sam Saint-Pettersen.
#
# Released under the MIT/X11 License.
#

function init {
	echo 'Initialized haul module.'
}

function version {
	echo 'abc'
}

function __callHaul {
	echo `ls -l`
}

case $1 in
a)
	__callHaul
	;; 
init)
	init
	;;
version)
	version
	;;
esac

