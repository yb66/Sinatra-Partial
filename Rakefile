# encoding: UTF-8

require 'rake'

task :default => "docs"

desc "(Re-) generate documentation and place it in the docs/ dir. Open the index.html file in there to read it."
task :docs => :"docs:yard"  
namespace :docs do
  require 'yard'
  YARD::Rake::YardocTask.new do |t|
    t.files   = ['lib/**/*.rb']
    t.options = ['-odocs/', '--no-private'] # optional
  end
end  
