# encoding: UTF-8

require "spec_helper"

require_relative "../lib/sinatra/partial.rb"

require_relative "../examples/app_no_underscores/app.rb"
require_relative "../examples/app_with_underscores/app.rb"
require_relative "../examples/app_with_underscores_and_erb/app.rb"
require_relative "../examples/app_with_underscores_and_erb_and_subdirs/app.rb"

shared_examples_for "all in examples dir" do
  let(:expected) { "<html><head></head><body><p>Time is #{Time.now}</p><ul><li class='klassic'>This</li><li class='klassic'>is</li><li class='klassic'>all</li><li class='klassic'>new</li></ul><p>A is A</p><p>B is B</p><p>C is C</p><p>D is D</p><p>Hello, World</p></body></html>" }
  subject { browser.last_response }
  it { should be_ok }
  it { subject.body.should == expected }
end

def new_session( app )
  Rack::Test::Session.new(Rack::MockSession.new( app ) )
end

Apps = [AppNoUnderscores, AppWithUnderscores, AppWithUnderscoresAndErb, AppWithUnderscoresAndErbAndSubdirs]

Apps.each do |app|
  describe app.to_s do
    let(:browser){  new_session( app ) }
    before{ browser.get '/' }
    it_should_behave_like "all in examples dir"
  end
end