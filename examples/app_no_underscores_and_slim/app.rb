require 'sinatra/base'
require 'slim'
require File.expand_path( File.join File.dirname(__FILE__), "../ext/kernel.rb")
require_relative "../../lib/sinatra/partial.rb"
require_relative "../whitespace_remove.rb"

module AppNoUnderscoresAndSlim
  class App < Sinatra::Base
    register Sinatra::Partial
    use WhiteSpaceRemove
    
    configure do 
      set :news, ["This", "is", "all", "new"]
      set :partial_template_engine, :slim
    end
    
    
    get "/" do  
      magic = partial :magic
      slim :home, :locals => { :show_me_magic => magic }
    end
  end
end