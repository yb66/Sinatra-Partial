require 'sinatra/base'
require_relative "../../lib/sinatra/partial.rb"
require 'haml'
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
