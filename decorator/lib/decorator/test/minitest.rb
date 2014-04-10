module MiniTest::Assertions
  def assert_decorated(actual)
    assert actual.respond_to?(:decorated?) && actual.decorated?, "expected that #{actual} would be decorated"
  end

  def assert_decorated_with(actual, expected)
    assert_includes actual.decorated_with, expected, "expected that #{actual} would be decorated with #{expected.inspect}"
  end
end

module MiniTest::Expectations
  infect_an_assertion :assert_decorated, :must_be_decorated, :reverse
  infect_an_assertion :assert_decorated_with, :must_be_decorated_with, :reverse
end

class Decorator
  include ::MiniTest::Expectations
end