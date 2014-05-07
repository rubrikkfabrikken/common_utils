module FormtasticAngular
  module Inputs
    class TextInput < Formtastic::Inputs::TextInput
      include Base::Wrapping
    end
  end
end
