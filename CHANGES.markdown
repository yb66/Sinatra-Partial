## next release ##

* Fixed example in README, re issue#4, thanks to @mollaza for pointing it out.
* better handling of paths, which helps fix a (hopefully rare) error when a dot is in the path.


## v0.3.0 ##

23rd of April 2012 

* Improved specs.
* Examples are slightly more complex, since the specs required it, which also helps to clarify use.
* Tested and passing for Ruby 1.8.7, 1.9.2 and 1.9.3.
* Project added to Travis CI.
* More documentation.
* Better organised development (at last!)
* A Rake file has arrived!


## v0.2.1 ##

10th of April 2012 

Sam Elliott provided a lot of helpful code to add in features that were lost from his gist, so many thanks to him. 

* Different template engines other than Haml may be specified
* Leading underscores (a la Rails) can be specified for partials too. 
* The lib is now a Sinatra Extension so the template engine and leading underscores can be configured for the application as a whole (and still overriden at call time). 
* Examples have been added to the examples directory 
* The code docs are much more extensive.


## v0.1.1 ##

9th of December 2011

* Improved the examples in the Readme file. A lot.


## v0.1.0 ##

4th of July 2011 

* The locals hash doesn't get clobbered if passing a collection now, but you do get the chance to clobber the default of passing the collection local if you so wish. With great power comes great responsibility!
