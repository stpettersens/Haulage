/*
Haul module [for Go code].
Haulage source code manager.
Copyright (c) 2011 Sam Saint-Pettersen.

Released under the MIT/X11 License.
*/
package haul

import (
	"fmt"
	"exec"
)

func Init() {
	fmt.Print("Initialized haul module.\n")
}

func Version() {
	out := callHaul("version()")
	fmt.Printf("%s\n", out)
}

func Pull(depfile string, quiet bool) {
	out := callHaul(fmt.Sprintf("pull('%s', false)", depfile))
	if(!quiet) {
		fmt.Printf("%s\n", out)
	}
}

func callHaul(method string) string {
	exec.Command("ruby", "haulapi.rb").Run()
	return "123"
}
