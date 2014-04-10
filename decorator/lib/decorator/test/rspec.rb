require 'rspec/expectations'

RSpec::Matchers.define :be_decorated do |expected|
  match do |actual|
    actual.respond_to?(:decorated?) && actual.decorated?
  end

  failure_message_for_should do |actual|
    "expected that #{actual} would be decorated"
  end

  failure_message_for_should_not do |actual|
    "expected that #{actual} would not be decorated"
  end
end

RSpec::Matchers.define :be_decorated_with do |expected|
  match do |actual|
    actual.respond_to?(:decorated_with) && actual.decorated_with.include?(expected)
  end

  failure_message_for_should do |actual|
    "expected that #{actual} would be decorated with #{expected.inspect}"
  end

  failure_message_for_should_not do |actual|
    "expected that #{actual} would not be decorated with #{expected.inspect}"
  end
end