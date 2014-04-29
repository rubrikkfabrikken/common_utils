module FormtasticAngular
  module Inputs
    class StringInput < Formtastic::Inputs::StringInput
      include Base::Wrapping
    end
  end
end
