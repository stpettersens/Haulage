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
	"bufio"
)

// Globals.
var rubyexec="ruby"

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
	c := exec.Command(rubyexec, "haulapi.rb")
	stdin, _ := c.StdinPipe()
	stdout, _ := c.StdoutPipe()
	c.Start()
	stdin.Write([]byte(fmt.Sprintf("Haul.%s", method)))
	stdin.Close()
	outbr := bufio.NewReader(stdout)
	result, _ := outbr.ReadSlice(13) // Stop at CR (carriage return) character.
	return string(result)
}
