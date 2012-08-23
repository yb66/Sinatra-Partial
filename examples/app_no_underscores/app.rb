require 'sinatra/base'
require 'haml'
require File.expand_path( File.join File.dirname(__FILE__), "../ext/kernel.rb")
require_relative "../../lib/sinatra/partial.rb"
require_relative "../whitespace_remove.rb"

module AppNoUnderscores
  class App < Sinatra::Base
    register Sinatra::Partial
    use WhiteSpaceRemove
    
    configure do 
      set :news, ["This", "is", "all", "new"]
    end
    
    
    get "/" do  
      magic = partial :magic
      haml :home, :locals => { :show_me_magic => magic }
    end
  end
end