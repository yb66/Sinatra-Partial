source "https://rubygems.org"

gemspec

gem "rake"

group :development do
  unless RUBY_ENGINE == 'jruby' || RUBY_ENGINE == "rbx"
    gem "pry-byebug"
  end
  gem "maruku"
  gem "yard"
  gem "travis-lint"
end

gem "sinatra", ">=2.0.0"

group :test do
  gem "rack-test"
  gem "rspec"
  gem "rspec-its"
  gem "simplecov"
  gem "haml"
  gem 'timecop'
  gem "slim"
end
