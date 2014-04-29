require 'active_support'

require 'formtastic/util'
require 'formtastic'

require File.expand_path(File.join(File.dirname(__FILE__), '../lib/formtastic_angular'))

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories in alphabetic order.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each {|f| require f}

module FakeHelpersModule
end

module FormtasticSpecHelper
  include Formtastic::Helpers::FormHelper
  include FormtasticAngular::Helpers::FormHelper
end
