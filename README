Quick note: If you do decide to use this gem, please let me know if it isn't working for you - make a contribution!

Back to our previously scheduled programming...

You may say "why is this needed?".

Go on then.

_huff_ "Why is this needed?"

Because I was forever copying the code I took from http://www.sinatrarb.com/faq.html#partials into each and every project. It may well be that this is included in some other gem full of useful helpers, but I haven't found it yet, and besides _this is what I really want_. The whole point of Sinatra is not to get a lot of stuff you didn't really need anyway.

So here it is, partials, and that's it.

Installation
============

    gem install sinatra-partial

Some examples
=============

At the top of your app.rb:

    require 'sinatra/partial'

    class Blah < Sinatra::Base
      helpers Sinatra::Partial
  

Inside a route:

    get "/" do
      output = ''
      post_links = some_array_full_of_links
      output << partial( :main, :locals => { :output => partial( :post_links, :locals => { title: "Posts", posts: post_links } ) }  )
      haml :content, :locals => { :output => output, title: "posts" }
    end

    
Here's one inside a view:

    - address = "ip#{ip.first.gsub(".", "_")}"
    - v = ip.last
    %div{class: "ip", id: "#{address}", ip: "#{ip.first}" }
      %a{name: "#{address}"}
      %h3= "#{ip.first}"
      %p= "last visit: #{v[:last_visit]} No. of visits: #{v[:visits]}"
      = partial( :geo, :locals => { geo: v[:geo] } )
      
      %a{href: "##{address}", class: "records", ip: "#{ip.first}"}
        Show/hide records
      %div{class: "records", ip: "#{ip.first}"}
        <h4>Records:</h4>
        = partial( :record, collection: v[:records] )

Yes, a tad confusing, but I can't be bothered to cook up a simple example - just look at the _partials_ and how they're used. Concentration brings insight (so it's said!)

Another quick note: Since the locals hash was getting clobbered when using a collection, I've changed the code so that you can pass in a collection _and_ locals that will be accessible too.

    = partial( :record, collection: v[:records], :locals => {something_else: 243} )
    
Now you'll be able to access the local `something_else` within the :record partial.

You can also decide to do some clobbering of your own and HULK SMASH! the defaults for the collection, which in this case would be :record (as it's the template name) and :layout => false. Perhaps you might need this so I've left it up to you, but probably best to leave it alone and call your locals something else. It's your code.

Thanks to Chris Schneider and Sam Elliott for sharing their code, I just made it into this gem.

MIT Licence (i.e. be good!)