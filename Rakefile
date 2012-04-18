# encoding: UTF-8

require 'rake'

desc "(Re-) generate documentation and place it in the docs/ dir. Open the index.html file in there to read it."
task :docs => :"docs:yard"  
namespace :docs do
  require 'yard'
  YARD::Rake::YardocTask.new do |t|
    t.files   = ['lib/**/*.rb', 'app/*.rb', 'models/*.rb']
    t.options = ['-odocs/'] # optional
  end
end  
