
Gem::Specification.new do |s|
  s.name        = 'rgerrit'
  s.version     = '0.0.0'
  s.date        = '2014-07-04'
  s.summary     = 'Ruby library for accessing Gerrit'
  s.description = 'Ruby library for accessing Gerrit...'
  s.authors     = ['Jinesh Jayakumar']
  s.email       = 'jineshkj at gmail dot com'
  s.files       = ['lib/rgerrit.rb']
  s.homepage    = 'https://github.com/jineshkj/rgerrit'
  s.license     = 'LGPLv3'

  s.add_runtime_dependency 'httclient', '~> 2.5.3.2', '>= 2.5.0'
end
