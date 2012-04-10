require 'sinatra'
require_relative "../../lib/sinatra/partial.rb"
require 'haml'

News = ["This", "is", "all", "new"]

set :partial_underscores, true

get "/" do
  haml :home
end

