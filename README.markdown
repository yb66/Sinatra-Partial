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

### Some examples ###

At the top of your app.rb:

    require 'sinatra/partial'

    class Blah < Sinatra::Base
      helpers Sinatra::Partial
  

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
      title = "My contrived example"
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
      


### Another quick note ###

 Since the locals hash was getting clobbered when using a collection, I've changed the code so that you can pass in a collection _and_ locals that will be accessible too.

    = partial( :record, collection: v[:records], :locals => {something_else: 243} )
    
Now you'll be able to access the local `something_else` within the `:record` partial.

### HULK SMASH!!! ###

You can also decide to do some clobbering of your own and HULK SMASH! the defaults for the collection, which in this case would be :record (as it's the template name) and :layout => false. Perhaps you might need this so I've left it up to you, but probably best to leave it alone and call your locals something else. It's your code.

### Thanks ###

Thanks to Chris Schneider and Sam Elliott for sharing their code, I just made it into this gem and tinkered ever so slightly.


### Licence ###

Copyright (c) 2011 Iain Barnett

MIT Licence

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


i.e. be good!