
task :default => :build

GEM_FILE = 'rgerrit-0.0.0.gem'

file GEM_FILE => Rake::FileList.new('lib/**/*.rb') do
  sh "gem build rgerrit.gemspec"
end

desc "Build rgerrit gem"
task :build => GEM_FILE

task :test => :build do
  sh "gem install --no-ri --no-rdoc rgerrit-0.0.0.gem"
  sh "ruby test.rb"
end
