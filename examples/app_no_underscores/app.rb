require 'sinatra/base'
require_relative "../../lib/sinatra/partial.rb"
require 'haml'
require_relative "../whitespace_remove.rb"


class AppNoUnderscores < Sinatra::Base
  register Sinatra::Partial
  use WhiteSpaceRemove
  
  News = ["This", "is", "all", "new"]
  
  get "/" do
    haml :home
  end
end
