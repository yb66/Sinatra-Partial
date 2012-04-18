require 'sinatra'
require_relative "../../lib/sinatra/partial.rb"
require 'erb'
require_relative "../whitespace_remove.rb"

class AppWithUnderscoresAndErb < Sinatra::Base
  register Sinatra::Partial
  use WhiteSpaceRemove

  News = ["This", "is", "all", "new"]
  
  set :partial_underscores, true
  set :partial_template_engine, :erb
  
  get "/" do
    erb :home
  end
end