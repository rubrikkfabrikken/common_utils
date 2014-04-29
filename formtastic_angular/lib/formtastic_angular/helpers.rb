module FormtasticAngular
  module Helpers
    extend ActiveSupport::Autoload

    autoload :FormHelper,  'formtastic_angular/helpers/form_helper'
    autoload :InputHelper, 'formtastic_angular/helpers/input_helper'
  end
end
