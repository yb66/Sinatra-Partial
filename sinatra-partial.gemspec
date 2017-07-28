# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sinatra/partial/version"

Gem::Specification.new do |s|
  s.name        = "sinatra-partial"
  s.version     = Sinatra::Partial::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Chris Schneider", "Sam Elliott", "Iain Barnett"]
  s.email       = ["iainspeed@gmail.com"]
  s.homepage    = "https://github.com/yb66/Sinatra-Partial"
  s.summary     = %q{A sinatra extension for render partials.}
  s.description = %q{Just the partials helper in a gem. That is all.}
  s.license     = 'MIT'

  s.add_dependency 'sinatra', ">=1.4"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
