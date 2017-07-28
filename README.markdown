## Sinatra Partial ##

Partials for Sinatra!

### Build status ###

Master branch:
[![Build Status](https://secure.travis-ci.org/yb66/Sinatra-Partial.png?branch=master)](http://travis-ci.org/yb66/Sinatra-Partial)

Develop branch:
[![Build Status for development branch](https://secure.travis-ci.org/yb66/Sinatra-Partial.png?branch=develop)](http://travis-ci.org/yb66/Sinatra-Partial)

### Quick note ###

If you do decide to use this gem, please let me know if it isn't working for you - make a contribution! Github makes it so simple..! See the [Contribution section](#Contributing) for more.

Back to our previously scheduled programming...

### Por qué? ###

You may say "why is this needed?".

Go on then.

_huff_ "Why is this needed?"

Because I was forever copying the code I took from http://www.sinatrarb.com/faq.html#partials into each and every project. It may well be that this is included in some other gem full of useful helpers, but I haven't found it yet, and besides _this is what I really want_. The whole point of Sinatra is not to get a lot of stuff you didn't really need anyway.

So here it is, partials, and that's it.

### Installation ###

    gem install sinatra-partial

### Getting started ###

At the top of your app.rb:

    require 'sinatra/partial'

For a classic app, that's all you need to do. For a modular app you should register it too:

    class Blah < Sinatra::Base
      register Sinatra::Partial


### Configuration options ###

The default templating engine is haml. If you wish to use something else, you can set in the config options:

    set :partial_template_engine, :erb

If you wish, you can also pass this in with the options hash to partial (if you do, it will override the above setting for that call):

    partial(:"meta/news", :template_engine => :erb)

If you like the Rails convention of adding an underscore to the beginning of a partial, set it here:

    enable :partial_underscores

Otherwise, the default is for no underscore (if you like Rails you know where to get it;)

*Note:*  

If you're using [Slim](https://rubygems.org/gems/slim) then there are examples in the examples directory, but the output is slightly different for some reason and [the project maintainers don't wish to be helpful](https://github.com/stonean/slim/issues/328). I don't use Slim, if you do then feel free to contribute and find out how to get the specs to pass, but I won't be pursuing this.

### Some examples ###

The docs are good to look at (big thanks to Sam Elliot for improving them a lot), just follow the docs link from this page if you can't find them:

https://rubygems.org/gems/sinatra-partial

or use yard/rdoc to generate them.


#### Inside a route ####

    get "/" do
      output = ""
      output << partial( :top )
      output << partial( :middle )
      output << partial( :bottom )
      output
    end
    
    -# top.haml
    %h2
      The is the top
      
    -# middle.haml
    %p
      Can you guess what I am yet?
    
    -# bottom.haml
    %p
      Is it worse to be at the bottom or the foot?


#### Local variables ####

    get "/" do
      output = ""
      @title = "My contrived example"
      username = current_user.username
      output << partial( :left_col )
      output << partial( :middle, :locals => { username: username} )
      output << partial( :right )
      output
    end
    
    -# middle.haml
    %p
      Wow, here is that #{username} you just passed me!  
      :-o
    
    
#### Here's one using views ####

Remember that since this is a helper method it can be called inside routes and views - use it where you need it!

    -# welcome_message.haml
    %h2
      Welcome back #{username}
      
    -# content.haml
    Blah Blah Blah
      
    -# footer.haml
    You've reached the bottom of the page!
    
    -# layout.haml
    %html
      %head
      %body
        #header
          = partial :welcome_message, locals: {username: "Iain" }

        #main
          = partial :content
          
          = yield
          
        #footer
          = partial :footer        
        

### Collections ###
        
Here's how to use a collection, in this case to render a menu:

    # app.rb
    
    before do
      @menu = [
                ["home", uri("/")],
                ["login", uri("/login")],
                ["contact_us", uri("/contact-us")],
                ["about", uri("/about")], 
             ]
    end
           
    
    -# menu.haml
    #nav
      %ul
        = partial :menu_item, collection: menu
      
    -# menu_item.haml
    - display_name, url = menu_item
    - atts ||= {}
    -# set the class of the  list item for the current page to 'active'
    - (atts[:class] = atts[:class].nil? ? "active" : "#{atts[:class]} active") if request.url == url
    
    %li{ atts }
      %a{ class: "nav", href: menu_item.last }
        = menu_item.first

      
    -# layout.haml
    %html
      %head
        %title= @title
      %body
        = yield
        
        = partial :menu, locals: { menu: @menu }
      
    
You'll get a menu built for you.


### Examples ###

Look in the examples directory for some very simple examples.


### Thanks ###

Thanks to Chris Schneider and Sam Elliott for sharing their code, and for sharing further updates.


### Contributing ###

Most of all, remember that **any** contribution you can make will be valuable, whether that is putting in a ticket for a feature request (or a bug, but they don't happen here;), cleaning up some grammar, writing some documentation (or even a blog post, let me know!) or a full blooded piece of code - it's **all** welcome and encouraged.

To contribute some code:

1. Fork this.
* `git clone git@github.com:YOUR_USERNAME/Sinatra-Partial.git`
* `git remote add upstream git://github.com/yb66/Sinatra-Partial.git`
* `git fetch upstream`
* `git checkout develop`
* Decide on the feature you wish to add.
    - Give it a snazzy name, such as kitchen_sink.
    - `git checkout -b kitchen_sink`
* Install Bundler.
    - `gem install bundler -r --no-ri --no-rdoc`
* Install gems from Gemfile.
    - `bundle install --binstubs --path vendor`
    - Any further updates needed, just run `bundle install`, it'll remember the rest.
* Write some specs.
* Write some code. (Yes, I believe that is the correct order, and you'll never find me doing any different;)
* Write some documentation using Yard comments - see http://rubydoc.info/docs/yard/file/docs/GettingStarted.md
  - Use real English (i.e. full stops and commas, no l33t or LOLZ). I'll accept American English even though it's ugly. Don't be surprised if I 'correct' it.
  - Code without comments won't get in, I don't have the time to work out what you've done if you're not prepared to spend some time telling me (and everyone else).
* Run `reek PATH_TO_FILE_WITH_YOUR_CHANGES` and see if it gives you any good advice. You don't have to do what it says, just consider it.
* Run specs to make sure you've not broken anything. If it doesn't pass all the specs it doesn't get in.
  - Have a look at coverage/index.htm and see if all your code was checked. We're trying for 100% code coverage.
  - If your commit changes the way things work or adds a feature then add an example in the examples dir. The specs run off the examples to make sure the library works with a real project while keeping the examples up to date, so make sure you add something there if needs be.
* Run `bin/rake docs` to generate documentation.
    - Open up docs/index.html and check your documentation has been added and is clear.
* Add a short summary of your changes to the top of CHANGES file. Add your name and a link to your bio/website if you like too. **Don't** add a version number, I'll handle that.
* Send me a pull request.
    - Don't merge into the develop branch!
    - Don't merge into the master branch!
    - see http://nvie.com/posts/a-successful-git-branching-model/ for more on how this is supposed to work.
* Wait for worldwide fame.
* Shrug and get on with you life when it doesn't arrive, but know you helped quite a few people in their life, even in a small way - 1000 raindrops will fill a bucket!