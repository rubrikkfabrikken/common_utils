module FormtasticAngular
  module Helpers
    module FormHelper
      def angular_form_for(record, options = {}, &block)
        options.merge!(
            builder: FormBuilder
        )

        semantic_form_for(record, options, &block)
      end
    end
  end
end
