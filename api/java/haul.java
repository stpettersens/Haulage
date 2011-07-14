/*
Haul module [for Java code].
Haulage source code manager.
Copyright (c) 2011 Sam Saint-Pettersen.

Released under the MIT/X11 License.
*/
package org.stpettersens.haul;
import java.io.*;

class Haul {
	// Members
	private static String rubyexec = "ruby";

	// Methods
	public static void init() {
		System.out.println("Initialized haul module.\n");
	}
	public static String version() {
		String[] out = this.callHaul("version()");
		System.out.println(out[0] + "\n");
	}
	private static String[] callHaul(String method) {
		String line;
		Process process = Runtime.getRuntime();
		process.exec(this.rubyexec + " haulapi.rb");
		OutputStream stdin = process.getOutputStream();
		InputStream stderr = process.getErrorStream();
		InputStream stdout = process.getInputStream();

		// Write params into stdin.
		line = String.format("Haul.(%s)", method);
		stdin.write(line.getBytes());
		stdin.flush();
		
	}
}
