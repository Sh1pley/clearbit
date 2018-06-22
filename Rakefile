require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |task|
  task.libs << "test"
  task.test_files = FileList["test/test**/test*.rb"]
  task.verbose = true
end