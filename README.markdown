Haulage
======

Haulage is a dependency manager for source code, written in Ruby.

It can "intelligently" retrieve dependencies defined in
a JSON-based dependencies file (e.g. *haul.deps*.) It 
supports retrieval through the [APT](http://en.wikipedia.org/wiki/Advanced_Packaging_Tool)
package manager (Debian systems) as well as standard HTTP and naturally [Ruby Gems](http://rubygems.org).

Haulage usage
-----

To pull dependencies for a project from its dependencies file, do:

 `[ruby] haulage --pull project.deps`

haul module usage
-----------------
Haulage is powered by the `haul` Ruby module, which you can use in your
own scripts or programs. API modules exist for other languages such as Python or Perl,
so that you can use haul with them in addition to Ruby.

The same effect as in the Haulage usage example can be achieved in Python code with:

    import haul # Import the Python API haul module.
    haul.init() # Initialize the haul module.
    haul.pull() # Pull dependencies from default file.

(*haul.deps* is the defaultly seeked depedencies file.)

Dependencies
------------

Programs:

* [Ruby](http://www.ruby-lang.org) 1.9+
* [MongoDB](http://www.mongodb.org)

The following Ruby gems:

* haul [core of haulage, included]
* [json](http://rubygems.org/gems/json)
* [mongo](http://rubygems.org/gems/mongo)
* [bson](http://rubygems.org/gems/bson)
* [bson_ext](http://rubygems.org/gems/bson_ext)

Install with `[sudo] gem install [haul] json mongo bson bson_ext`

License
-------
Haulage is licensed under the MIT/X11 License.
