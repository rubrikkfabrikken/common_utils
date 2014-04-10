require 'rspec/autorun'

require_relative '../lib/decorator'
require_relative '../lib/decorator/test/rspec'

class SampleDecorator < Decorator; end
class AnotherDecorator < Decorator; end

describe "decorator/test/rspec" do
  describe "be_decorated" do
    it "should raise an error for an undecorated object" do
      undecorated_object = "double"

      expect { undecorated_object.should be_decorated }.to raise_error
    end

    it "should not raise an error for a decorated object" do
      decorated_object = SampleDecorator.new("double")

      decorated_object.should be_decorated
    end
  end

  describe "be_decorated_with" do
    it "should raise an error for a object decorated with a wrong decorator" do
      decorated_object = AnotherDecorator.new("double")

      expect { decorated_object.should be_decorated_with(SampleDecorator) }
        .to raise_error
    end

    it "should not raise an error for a object decorated with the right decorator" do
      decorated_object = SampleDecorator.new("double")

      decorated_object.should be_decorated_with(SampleDecorator)
    end
  end
end