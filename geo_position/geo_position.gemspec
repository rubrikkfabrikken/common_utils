Gem::Specification.new do |s|
  s.name        = 'geo_position'
  s.version     = '0.0.1'
  s.license     = 'MIT'
  s.date        = '2014-04-09'

  s.summary     = 'A simple container for longitude and latitude.'
  s.description = 'GeoPosition provides a simple Mongoid compatible object for containing longitude and latitude values.'

  s.authors     = ['Jonas Amundsen']
  s.email       = ['jonasba+gem@gmail.com']

  s.files       = %w[
    lib/geo_position.rb
    spec/geo_position_spec.rb
    Gemfile
    Gemfile.lock
    LICENSE
    geo_position.gemspec
  ]

  # Mabye one day
  # s.add_optional_dependency('minitest')
  # s.add_optional_dependency('rspec')

  s.add_development_dependency('rspec')
end