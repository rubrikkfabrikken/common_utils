module FormtasticAngular
  module Inputs
    module Base
      module Wrapping
        def input_wrapping(&block)
          template.content_tag(:li,
                               [template.capture(&block), angular_error_template_html, hint_html].join("\n").html_safe,
                               wrapper_html_options
          )
        end

        def angular_error_template_html
          error_class = options[:error_class] || builder.default_inline_error_class
          template.content_tag(:p, "{{#{object_name_with_index}.errors.#{method}.join(', ')}}", :class => error_class,
                               :'data-ng-show' => "#{object_name_with_index}.errors.#{method}.length > 0")
        end

        private

        def object_name_with_index
          if builder.options.has_key?(:index)
            "#{object_name}[#{builder.options[:index]}]"
          else
            object_name
          end
        end
      end
    end
  end
end
