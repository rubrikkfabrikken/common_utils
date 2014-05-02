module FormtasticAngular
  class FormBuilder < Formtastic::FormBuilder
    include FormtasticAngular::Helpers::InputHelper

    def initialize(*args)
      super

      options = args.find { |arg| Hash === arg }

      options[:html] ||= {}
      options[:html][:'data-ng-submit'] = "$event.preventDefault(); #{object_name}_submit()"
    end
  end
end
