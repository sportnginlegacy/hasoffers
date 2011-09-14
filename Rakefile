require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
end
