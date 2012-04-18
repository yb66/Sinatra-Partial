# encoding: UTF-8

require_relative "./spec_helper.rb"

require_relative "../lib/sinatra/partial.rb"

require_relative "../examples/app_with_underscores_and_erb_and_subdirs/app.rb"
set :environment, :test

describe 'app_with_underscores_and_erb_and_subdirs' do

  def app
    Sinatra::Application
  end

  before{ get '/' }
  let(:expected) { "<html>\n  <head></head>\n  <body>\n    Time is #{Time.now}\n    \n    <ul>\n      <li>\n  This\n</li>\n<li>\n  is\n</li>\n<li>\n  all\n</li>\n<li>\n  new\n</li>\n    </ul>\n      \n    <p>A is A</p>\n<p>B is B</p> \n<p>C is C</p>\n<p>D is D</p>\n    \n    <p>\n  Hello, World\n</p>\n  </body>\n</html>" }
  subject { last_response }
  it { subject.should be_ok }
  it { subject.body.should == expected }

end