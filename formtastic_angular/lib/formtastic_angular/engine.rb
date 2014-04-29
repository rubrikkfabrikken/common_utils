module FormtasticAngular
  class Engine < ::Rails::Engine
    initializer 'formtastic_angular.initialize' do
      ActiveSupport.on_load(:action_view) do
        include FormtasticAngular::Helpers::FormHelper
      end
    end
  end
end
