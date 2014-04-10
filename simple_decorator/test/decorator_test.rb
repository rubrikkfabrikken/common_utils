require 'minitest/autorun'

require_relative '../lib/simple_decorator'

class SampleDecorator < BaseDecorator; end
class AnotherDecorator < BaseDecorator; end

describe BaseDecorator do
  describe "#initialize" do
    it "should not accept no arguments" do
      assert_raises(ArgumentError) { SampleDecorator.new }
    end
  end

  describe "#decorator_class" do
    it "should return the class of the decorator" do
      decorated_object = SampleDecorator.new("double")

      assert_equal(decorated_object.decorator_class, SampleDecorator)
    end
  end

  describe "#decorated_with" do
    it "should contain both decorators of a double-decorated object" do
      decorated_object = AnotherDecorator.new(SampleDecorator.new("double"))

      assert_includes(decorated_object.decorated_with, SampleDecorator)
      assert_includes(decorated_object.decorated_with, AnotherDecorator)
    end
  end

  describe "#decorated?" do
    it "should return true for a decorated object" do
      decorated_object = SampleDecorator.new("double")

      assert(decorated_object.decorated?)
    end
  end
end
