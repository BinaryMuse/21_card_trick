require 'rake/testtask'

task :default => :test

Rake::TestTask.new do |t|
  t.libs.push 'lib'
  t.test_files = FileList["spec/**/*.rb"]
  t.verbose = true
end
