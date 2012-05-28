require 'sinatra/base'
require 'erb'
require File.expand_path( File.join File.dirname(__FILE__), "../ext/kernel.rb")
require_relative "../../lib/sinatra/partial.rb"
require_relative "../whitespace_remove.rb"

module AppWithUnderscoresAndErbAndSubdirs
  class App < Sinatra::Base
    register Sinatra::Partial
    use WhiteSpaceRemove
    
    News = ["This", "is", "all", "new"]
    
    enable :partial_underscores
    set :partial_template_engine, :erb
    
    
    get "/" do
      magic = partial :"partials/magic"
      erb :home, :locals => { :show_me_magic => magic }
    end
  end
end