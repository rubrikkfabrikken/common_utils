Gem::Specification.new do |s|
  s.name        = 'geo_data'
  s.version     = '0.0.3'
  s.license     = 'MIT'
  s.date        = '2014-05-11'

  s.summary     = 'A small library for executing requests against GeoData and wrapping responses.'
  s.description = 'Geodata provides a very simple library configuraring and executing requests against GeoData, as well as wrapping the returned JSON response.'

  s.authors     = ['Jonas Amundsen']
  s.email       = ['jonasba+gem@gmail.com']

  s.files       = %w[
    lib/geo_data/request.rb
    lib/geo_data/response.rb
    lib/geo_data.rb
    LICENSE
    geo_data.gemspec
    README.md
  ]

  s.add_dependency('activesupport')
end
