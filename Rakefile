require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = Dir.glob("{test,spec,features}/**/*")
end
