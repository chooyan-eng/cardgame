require('rake/testtask')

Rake::TestTask.new do |t| 
  t.libs << './src'
  t.test_files = FileList['**/*_test.rb']
  t.warning = true
end
