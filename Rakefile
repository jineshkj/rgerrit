
desc "Build rgerrit gem"
task :build do
  sh "gem build rgerrit.gemspec"
end

task :test => :build do
  sh "gem install --no-ri --no-rdoc rgerrit-0.0.0.gem"
  sh "ruby test.rb"
end
