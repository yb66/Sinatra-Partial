# encoding: utf-8

module AppNoUnderscores

  require_relative "./app.rb"
  
  def self.app
    Rack::Builder.app do
      run App
    end
  end # self.app

end