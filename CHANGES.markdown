## Upcoming ##

* Fix for some errors on 1.8.7 and 1.9.2 builds when run on Travis. Thanks to [@petems](https://github.com/petems).

----


## v0.4.0 ##

10th of December 2012

* Fixed example in README, re issue#4, thanks to [@moollaza](https://github.com/moollaza) for pointing it out.
* better handling of paths, which helps fix a (hopefully rare) error when a dot is in the path.

----


## v0.3.2 ##

23rd of August 2012

* Updated the examples to use a setting instead of a constant (because JRuby didn't like it, and because it is a bit weird).
* Ran specs against Rubinius and JRuby(1.9 API) and they passed, so they've been added to the Travis CI as well.
* Updated the README to make the build status a bit clearer.

7th of June 2012

* Fixes to README.

----


## v0.3.1 ##

28th of May 2012

* Fixed a bug where partials called within a route would not have layout set to false by default. To be honest, I think it's a change in the Sinatra codebase, but it was easily fixed by setting layout to false with the partial method. This does, however, mean that partial can't be called to run a layout, but if you're using it that way then you're using it wrong! Try just calling `haml` or `erb`.
* Improved the examples by adding a config.rb and config.ru. Not only does it mean the examples can be run from the command line easier, but I think it's a good way to set up an app to help with testing.

----


## v0.3.0 ##

23rd of April 2012

* Improved specs.
* Examples are slightly more complex, since the specs required it, which also helps to clarify use.
* Tested and passing for Ruby 1.8.7, 1.9.2 and 1.9.3.
* Project added to Travis CI.
* More documentation.
* Better organised development (at last!)
* A Rake file has arrived!

----


## v0.2.1 ##

10th of April 2012

Sam Elliott provided a lot of helpful code to add in features that were lost from his gist, so many thanks to him.

* Different template engines other than Haml may be specified
* Leading underscores (a la Rails) can be specified for partials too.
* The lib is now a Sinatra Extension so the template engine and leading underscores can be configured for the application as a whole (and still overriden at call time).
* Examples have been added to the examples directory
* The code docs are much more extensive.

----


## v0.1.1 ##

9th of December 2011

* Improved the examples in the Readme file. A lot.

----


## v0.1.0 ##

4th of July 2011

* The locals hash doesn't get clobbered if passing a collection now, but you do get the chance to clobber the default of passing the collection local if you so wish. With great power comes great responsibility!
