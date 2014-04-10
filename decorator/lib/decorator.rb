class Decorator < BasicObject
  def initialize(object)
    @object = object
  end

  def method_missing(method, *args)
    if object.respond_to?(method)
      object.send(method, *args)
    else
      super
    end
  end

  def decorated_with
    if object.respond_to?(:decorated_with)
      [decorator_class] + object.decorated_with
    else
      [decorator_class]
    end
  end

  def decorated?
    true
  end

  def respond_to?(method)
    methods = %w(
      decorated?
      decorated_with
      decorated_class
    )

    methods.include?(method.to_s) || super
  end

  class << self
    def inherited(subclass)
      subclass.class_eval <<-EVAL
        def decorator_class
          ::#{subclass.to_s}
        end
      EVAL
    end
  end

  private

  attr_accessor :object
end