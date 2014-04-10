require 'minitest/autorun'

require_relative '../lib/decorator'
require_relative '../lib/decorator/test/minitest'

class SampleDecorator < Decorator; end
class AnotherDecorator < Decorator; end

describe "decorator/test/minitest" do
  describe "be_decorated" do
    it "should raise an error for an undecorated object" do
      undecorated_object = "double"

      proc { undecorated_object.must_be_decorated }.must_raise(MiniTest::Assertion)
    end

    it "should not raise an error for a decorated object" do
      decorated_object = SampleDecorator.new("double")

      decorated_object.must_be_decorated
    end
  end

  describe "be_decorated_with" do
    it "should raise an error for a object decorated with a wrong decorator" do
      decorated_object = AnotherDecorator.new("double")

      proc { decorated_object.must_be_decorated_with(SampleDecorator) }
        .must_raise(MiniTest::Assertion)
    end

    it "should not raise an error for a object decorated with the right decorator" do
      decorated_object = SampleDecorator.new("double")

      decorated_object.must_be_decorated_with(SampleDecorator)
    end
  end
end