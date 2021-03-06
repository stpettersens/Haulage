<?php
/*
Haul module [for PHP code].
Haulage source code manager.
Copyright (c) 2011 Sam Saint-Pettersen.

Released under the MIT/X11 License.
*/

class Haul {
	// Members
	private static $descriptorspec = array(
		0 => array("pipe", "r"), // stdin is a pipe that the child will read from.
		1 => array("pipe", "w"), // stdout is a pipe that the child will write to.
		2 => array("file", "/dev/null", "w") // stderror is written to '/dev/null'.
	);
	private static $cwd = null;
	private static $env = null;

	// Methods
	public static function init() {
		echo "Initialized haul module.\n";
	}
	public static function version() {
		$out = self::callHaul('version()');
		echo "$out[0]\n";
	}
	public static function pull($depfile='haul.deps', $quiet=FALSE) {
		$out = self::callHaul("pull('$depfile', false)");
		if (!$quiet) {
			foreach($out as $o) {
				echo "$o\n";
			}
		}
	}
	public static function push($depfile='haul.deps', $quiet=FALSE) {
		$out = self::callHaul("push('$depfile', false)");
		if (!$quiet) {
			foreach($out as $o) {
				echo "$o\n";
			}
		}
	}
	private static function callHaul($method) {
		$process = proc_open("haulapi.rb", self::$descriptorspec, $pipes, self::$cwd, self::$env);

		if(is_resource($process)) {
			// $pipes now look like this:
			// 0 => writable handle connected to child stdin.
			// 1 => readble handle connected to child stdout.
			// Any error output will be written to /dev/null.
			fwrite($pipes[0], "Haul.$method");
			fclose($pipes[0]);

			$line = stream_get_contents($pipes[1]);
			$result = split("\n", $line);
			fclose($pipes[1]);
			proc_close($process);
			return $result;
		}
	}
}
?>
