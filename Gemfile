source "https://rubygems.org"

gemspec

group :development do
  gem "rake"
  unless RUBY_ENGINE == 'jruby' || RUBY_ENGINE == "rbx"
    gem "pry-byebug"
  end
  gem "reek"
  gem "maruku"
  gem "yard"
  gem "travis-lint"
end

group :test do
  gem "rake"
  gem "rack-test"
  gem "rspec"
  gem "simplecov"
  gem "haml"
  gem 'timecop'
  gem "slim"
end
