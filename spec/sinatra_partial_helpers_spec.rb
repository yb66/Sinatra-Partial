# encoding: UTF-8

require "spec_helper"
require_relative "../lib/sinatra/partial.rb"


describe "Helpers::partial" do
  
  engines = [:haml, :erb]
  underscores = [true, false]
  partials = ["news", "meta/news"]
  engines.product(underscores).product(partials).map{|x| x.flatten}.each do |(engine, underscore, partial)|
    context "Engine: #{engine} Underscores: #{underscore}, Partial: #{partial}" do
      let(:settings) { OpenStruct.new({:partial_template_engine => engine, :underscores => underscore}) }
      
      pending "Need to find a way to run spec without Sinatra, which so far is proving tricky, as that's kind of the point."
    end
  end
end