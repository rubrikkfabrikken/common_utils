Gem::Specification.new do |s|
  s.name        = 'formtastic_angular'
  s.version     = '0.0.1'
  s.license     = 'MIT'
  s.date        = '2014-04-29'

  s.summary     = 'Provides "angular templated" forms.'
  s.description = 'FormtasticAngular offers a form builder for formtastic which creates forms that adhere to some angular principles.'

  s.authors     = ['Jonas Amundsen']
  s.email       = ['jonasba+gem@gmail.com']

  s.files       = %w[
    config/secrets.yml
    lib/formtastic_angular/helpers/form_helper.rb
    lib/formtastic_angular/helpers/input_helper.rb
    lib/formtastic_angular/inputs/base/wrapping.rb
    lib/formtastic_angular/inputs/base.rb
    lib/formtastic_angular/inputs/password_input.rb
    lib/formtastic_angular/inputs/string_input.rb
    lib/formtastic_angular/engine.rb
    lib/formtastic_angular/form_builder.rb
    lib/formtastic_angular/helpers.rb
    lib/formtastic_angular/inputs.rb
    lib/formtastic_angular.rb
    spec/helpers/form_helper_spec.rb
    spec/helpers/input_helper_spec.rb
    spec/support/test_environment.rb
    spec/spec_helper.rb
    formtastic_angular.gemspec
    Gemfile
    Gemfile.lock
    LICENSE
    README.md
  ]

  s.add_dependency('formtastic')

  s.add_development_dependency(%q<rspec-rails>, ["~> 2.8.0"])
  s.add_development_dependency(%q<rspec_tag_matchers>, [">= 1.0.0"])
  s.add_development_dependency(%q<hpricot>, ["~> 0.8.3"])
  s.add_development_dependency(%q<BlueCloth>) # for YARD
  s.add_development_dependency(%q<yard>, ["~> 0.6"])
  s.add_development_dependency(%q<colored>)
  s.add_development_dependency(%q<tzinfo>)
  s.add_development_dependency(%q<ammeter>, ["~> 0.2.2"])
  s.add_development_dependency(%q<appraisal>)
  s.add_development_dependency(%q<rake>)
  s.add_development_dependency(%q<activemodel>)
  s.add_development_dependency(%q<webrat>)
end
