## Sinatra Partial ##

Partials for Sinatra!

### Quick note ###

If you do decide to use this gem, please let me know if it isn't working for you - make a contribution! Github makes it so simple..!

Back to our previously scheduled programming...

### Por qué? ###

You may say "why is this needed?".

Go on then.

_huff_ "Why is this needed?"

Because I was forever copying the code I took from http://www.sinatrarb.com/faq.html#partials into each and every project. It may well be that this is included in some other gem full of useful helpers, but I haven't found it yet, and besides _this is what I really want_. The whole point of Sinatra is not to get a lot of stuff you didn't really need anyway.

So here it is, partials, and that's it.

### Installation ###

    gem install sinatra-partial

### Configuration options ###

The default templating engine is haml. If you wish to use something else, you can set in the config options:

    set :partial_template_engine, :erb

If you wish, you can also pass this in with the options hash to partial (if you do, it will override the above setting for that call):

    partial(:"meta/news", :template_engine => :erb

If you like the Rails convention of adding an underscore to the beginning of a partial, set it here:

    set :partial_underscores, true

Otherwise, the default is for no underscore (if you like Rails you know where to get it;)

### Getting started ###

At the top of your app.rb:

    require 'sinatra/partial'

For a classic app, that's all you need to do. For a modular app you should register it too:

    class Blah < Sinatra::Base
      register Sinatra::Partial


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
    - atts ||= {}
    - atts[:active] = {class: "active" } if request.url == menu_item.last
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


### Licence ###

Copyright (c) 2012 Iain Barnett

MIT Licence

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


i.e. be good!