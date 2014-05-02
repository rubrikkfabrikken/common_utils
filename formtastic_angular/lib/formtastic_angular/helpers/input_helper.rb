module FormtasticAngular
  module Helpers
    module InputHelper
      def input(method, options = {})
        options.deep_merge!(
            :input_html => {
                :'data-ng-model' => "#{angular_friendly_object_name_with_index}.#{method}"
            }
        )

        super
      end

      def standard_input_class_name(as)
        if ::Object.const_defined?("FormtasticAngular::Inputs::#{as.to_s.camelize}Input")
          "FormtasticAngular::Inputs::#{as.to_s.camelize}Input"
        else
          super
        end
      end

      private

      def angular_friendly_object_name_with_index
        if options.has_key?(:index)
          "#{angular_friendly_object_name}[#{options[:index]}]"
        else
          angular_friendly_object_name
        end
      end

      def angular_friendly_object_name
        object_name.to_s.gsub(/\[|\]/, '[' => '.', ']' => '')
      end
    end
  end
end
