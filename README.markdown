Haulage
======

Haulage is a dependency manager for source code.
It can "intelligently" retrieve dependencies defined in
a JSON-based dependencies file (e.g. *project.deps*.) It 
supports retrieval through the [APT](http://en.wikipedia.org/wiki/Advanced_Packaging_Tool)
package manager as well as standard HTTP (on Debian-based systems).

Haulage usage
-----

To pull dependencies for a project from its dependencies file, do:

 `[ruby] haulage --pull project.deps`

haul module usage
-----------------
Haulage is powered by the `haul` Ruby module, which you can use in your
own scripts or programs. API modules exist for Python and Perl [WIP] as well as Ruby.

The same effect as in the Haulage usage example can be achieved in Python code with:

    import haul
	haul.pull()

(*project.deps* is the defaultly seeked depedencies file.)

Dependencies
------------

Programs:

* [Ruby](http://www.ruby-lang.org) 1.9+
* [MongoDB](http://www.mongodb.org)

The following Ruby gems:

* haul [core of haulage, included]
* [json](http://rubygems.org/gems/json)
* [mongo](http://rubygems.org/gems/mongo)
* bison-ext

Install with `[sudo] gem install json mongo bison-ext`

License
-------
Haulage is licensed under the MIT/X11 License.
