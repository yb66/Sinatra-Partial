require 'sinatra/base'
require 'haml'
require File.expand_path( File.join File.dirname(__FILE__), "../ext/kernel.rb")
require_relative "../../lib/sinatra/partial.rb"
require_relative "../whitespace_remove.rb"

class AppWithUnderscores < Sinatra::Base
  register Sinatra::Partial
  use WhiteSpaceRemove
  
  News = ["This", "is", "all", "new"]
  
  set :partial_underscores, true
  
  
  get "/" do
    haml :home
  end
end
