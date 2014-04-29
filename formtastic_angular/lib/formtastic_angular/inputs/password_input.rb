module FormtasticAngular
  module Inputs
    class PasswordInput < Formtastic::Inputs::PasswordInput
      include Base::Wrapping
    end
  end
end
