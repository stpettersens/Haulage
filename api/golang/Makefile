#
# Makefile for Go Haul API module.
#
include $(GOROOT)/src/Make.inc

TARG=haul
GOFILES=\
	haul.go\

include $(GOROOT)/src/Make.pkg

# Build + install the haul API module for Go with `gomake install`;
# build the demonstration program with `gomake demo`.
# Change 8g and 8l to your platform's compiler + linker;
# also change the linked file suffix, as necessary (e.g. from 8).
demo:
	echo "Building demo program..."
	8g demo.go && 8l -o demo demo.8 && rm demo.8

#cleanup:
#	rm -r -f _go_.8 _obj
