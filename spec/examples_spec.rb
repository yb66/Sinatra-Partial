# encoding: UTF-8

require "spec_helper"

require_relative "../lib/sinatra/partial.rb"

require_relative "../examples/app_no_underscores/config.rb"
require_relative "../examples/app_with_underscores/config.rb"
require_relative "../examples/app_with_underscores_and_erb/config.rb"
require_relative "../examples/app_with_underscores_and_erb_and_subdirs/config.rb"
#require_relative "../examples/app_no_underscores_and_slim/config.rb"


shared_context "Running different apps" do |c|
  include Rack::Test::Methods
  let(:app){ c.app }
  before{ get '/' }
end


shared_examples_for "all in examples dir" do
  subject { last_response }
  it { should be_ok }
  its(:body) { should == expected }
end


[AppNoUnderscores, AppWithUnderscores, AppWithUnderscoresAndErb, AppWithUnderscoresAndErbAndSubdirs
].each do |c|
  describe c.to_s do
    include_context "Running different apps", c
    it_should_behave_like "all in examples dir" do
      let(:expected) { "<html><head></head><body><p>Time is #{Time.now}</p><ul><li class='klassic'>This</li><li class='klassic'>is</li><li class='klassic'>all</li><li class='klassic'>new</li></ul><p>A is A</p><p>B is B</p><p>C is C</p><p>D is D</p><p>Hello, World</p><p>Show me magic!</p></body></html>" }
    end
  end
end