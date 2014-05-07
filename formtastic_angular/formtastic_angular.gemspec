Gem::Specification.new do |s|
  s.name        = 'formtastic_angular'
  s.version     = '0.0.3'
  s.license     = 'MIT'
  s.date        = '2014-04-29'

  s.summary     = 'Provides "angular templated" forms.'
  s.description = 'FormtasticAngular offers a form builder for formtastic which creates forms that adhere to some angular principles.'

  s.authors     = ['Jonas Amundsen']
  s.email       = ['jonasba+gem@gmail.com']

  s.files       = %w[
    lib/formtastic_angular/engine.rb
    lib/formtastic_angular/form_builder.rb
    lib/formtastic_angular/helpers/form_helper.rb
    lib/formtastic_angular/helpers/input_helper.rb
    lib/formtastic_angular/helpers.rb
    lib/formtastic_angular/inputs/base.rb
    lib/formtastic_angular/inputs/base/wrapping.rb
    lib/formtastic_angular/inputs/password_input.rb
    lib/formtastic_angular/inputs/string_input.rb
    lib/formtastic_angular/inputs/text_input.rb
    lib/formtastic_angular/inputs.rb
    lib/formtastic_angular.rb
    lib/locale/en.yml
    spec/actions/button_action_spec.rb
    spec/actions/generic_action_spec.rb
    spec/actions/input_action_spec.rb
    spec/actions/link_action_spec.rb
    spec/builder/custom_builder_spec.rb
    spec/builder/error_proc_spec.rb
    spec/builder/semantic_fields_for_spec.rb
    spec/generators/formtastic/form/form_generator_spec.rb
    spec/generators/formtastic/install/install_generator_spec.rb
    spec/helpers/action_helper_spec.rb
    spec/helpers/actions_helper_spec.rb
    spec/helpers/form_helper_spec.rb
    spec/helpers/input_helper_spec.rb
    spec/helpers/inputs_helper_spec.rb
    spec/helpers/reflection_helper_spec.rb
    spec/helpers/semantic_errors_helper_spec.rb
    spec/i18n_spec.rb
    spec/inputs/boolean_input_spec.rb
    spec/inputs/check_boxes_input_spec.rb
    spec/inputs/country_input_spec.rb
    spec/inputs/custom_input_spec.rb
    spec/inputs/date_picker_input_spec.rb
    spec/inputs/date_select_input_spec.rb
    spec/inputs/datetime_picker_input_spec.rb
    spec/inputs/datetime_select_input_spec.rb
    spec/inputs/deprecated_time_date_datetime_inputs_spec.rb
    spec/inputs/email_input_spec.rb
    spec/inputs/file_input_spec.rb
    spec/inputs/hidden_input_spec.rb
    spec/inputs/include_blank_spec.rb
    spec/inputs/label_spec.rb
    spec/inputs/number_input_spec.rb
    spec/inputs/password_input_spec.rb
    spec/inputs/phone_input_spec.rb
    spec/inputs/placeholder_spec.rb
    spec/inputs/radio_input_spec.rb
    spec/inputs/range_input_spec.rb
    spec/inputs/search_input_spec.rb
    spec/inputs/select_input_spec.rb
    spec/inputs/string_input_spec.rb
    spec/inputs/text_input_spec.rb
    spec/inputs/time_picker_input_spec.rb
    spec/inputs/time_select_input_spec.rb
    spec/inputs/time_zone_input_spec.rb
    spec/inputs/url_input_spec.rb
    spec/inputs/with_options_spec.rb
    spec/localizer_spec.rb
    spec/spec_helper.rb
    spec/spec.opts
    spec/support/custom_macros.rb
    spec/support/deferred_garbage_collection.rb
    spec/support/deprecation.rb
    spec/support/test_environment.rb
    formtastic_angular.gemspec
    Gemfile
    Gemfile.lock
    LICENSE
    README.md
  ]


  s.add_dependency('formtastic')

  s.add_development_dependency(%q<rails>, ["~> 3.0"])
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
