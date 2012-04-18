require 'sinatra'
require_relative "../../lib/sinatra/partial.rb"
require 'haml'
require_relative "../whitespace_remove.rb"

class AppWithUnderscoresAndErbAndSubdirs < Sinatra::Base
  register Sinatra::Partial
  use WhiteSpaceRemove
  
  News = ["This", "is", "all", "new"]
  
  set :partial_underscores, true
  set :partial_template_engine, :erb
  
  
  get "/" do
    erb :home
  end
end

