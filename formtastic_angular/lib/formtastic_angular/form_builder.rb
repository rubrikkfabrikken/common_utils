module FormtasticAngular
  class FormBuilder < Formtastic::FormBuilder
    include FormtasticAngular::Helpers::InputHelper

    def initialize(object_name, object, template, options)
      options[:html][:'data-ng-submit'] = "$event.preventDefault(); #{object_name}_submit()"

      super
    end
  end
end
