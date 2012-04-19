# encoding: UTF-8

require "spec_helper"
require_relative "../lib/sinatra/partial.rb"


describe "partial_expand_path" do

  subject{ Sinatra::Partial::Private.partial_expand_path( partial_path, underscores ) }
  
  context "Given a single word" do
    let(:partial_path) { "news" }
    context "and underscores is set to false." do
      let(:expected) { :"./news" }
      let(:underscores) { false }
      it { should == expected }
    end
    context "and underscores is set to true." do
      let(:expected) { :"./_news" }
      let(:underscores) { true }
      it { should == expected }
    end
  end
  context "Given a path" do
    let(:partial_path) { "meta/news" }
    context "and underscores is set to false." do
      let(:expected) { :"meta/news" }
      let(:underscores) { false }
      it { should == expected }
    end
    context "and underscores is set to true." do
      let(:expected) { :"meta/_news" }
      let(:underscores) { true }
      it { should == expected }
    end
  end
end