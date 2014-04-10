Gem::Specification.new do |s|
  s.name        = 'simple_decorator'
  s.version     = '0.0.2'
  s.license     = 'MIT'
  s.date        = '2014-04-09'

  s.summary     = 'Object decorator for Ruby.'
  s.description = 'SimpleDecorator provides a simple way of decorating Ruby objects..'

  s.authors     = ['Jonas Amundsen']
  s.email       = ['jonasba+gem@gmail.com']

  s.files       = %w[
    lib/simple_decorator/test/minitest.rb
    lib/simple_decorator/test/rspec.rb
    lib/simple_decorator.rb
    test/
    Gemfile
    Gemfile.lock
    LICENSE
    simple_decorator.gemspec
  ]

  # Mabye one day
  # s.add_optional_dependency('minitest')
  # s.add_optional_dependency('rspec')

  s.add_development_dependency('minitest')
  s.add_development_dependency('rspec')
end