module FormtasticAngular
  module Helpers
    module InputHelper
      def input(method, options = {})
        options.deep_merge!(
            :input_html => {
                :'data-ng-model' => "#{@object_name}.#{method}"
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
    end
  end
end
