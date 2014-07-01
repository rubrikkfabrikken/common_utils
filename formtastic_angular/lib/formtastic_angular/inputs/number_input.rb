module FormtasticAngular
  module Inputs
    class NumberInput < Formtastic::Inputs::NumberInput
      include Base::Wrapping
    end
  end
end
