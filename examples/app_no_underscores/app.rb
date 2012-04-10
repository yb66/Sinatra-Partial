require 'sinatra'
require_relative "../../lib/sinatra/partial.rb"
require 'haml'

News = ["This", "is", "all", "new"]

get "/" do
  haml :home
end

