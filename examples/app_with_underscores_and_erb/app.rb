require 'sinatra/base'
require 'erb'
require File.expand_path( File.join File.dirname(__FILE__), "../ext/kernel.rb")
require_relative "../../lib/sinatra/partial.rb"
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