require 'sinatra'
require_relative "../../lib/sinatra/partial.rb"
require 'haml'

News = ["This", "is", "all", "new"]

set :partial_underscores, true
set :partial_template_engine, :erb


get "/" do
  erb :home
end

