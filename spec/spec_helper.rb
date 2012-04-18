# encoding: UTF-8

require 'rspec'
Spec_dir = File.expand_path( File.dirname __FILE__ )

# code coverage
require 'simplecov'
SimpleCov.start

require "rack/test"
ENV['RACK_ENV'] ||= 'test'
ENV["EXPECT_WITH"] ||= "racktest"

require "logger"
logger = Logger.new STDOUT
logger.level = Logger::DEBUG
logger.datetime_format = '%a %d-%m-%Y %H%M '
LOgger = logger


Dir[ File.join( Spec_dir, "/support/**/*.rb")].each do |f| 
  puts "requiring #{f}"
  require f
end