require 'formtastic_angular/engine' if defined?(::Rails)

module FormtasticAngular
  extend ActiveSupport::Autoload

  autoload :FormBuilder, 'formtastic_angular/form_builder'
  autoload :Helpers,     'formtastic_angular/helpers'
  autoload :Inputs,      'formtastic_angular/inputs'
end
