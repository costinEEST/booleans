module Boolean
  require "singleton"
  class Error < StandardError; end
end

class MyBoolean
  include Boolean
end

class MyTrue < MyBoolean
  include Boolean
  include Singleton

  def not
    MyFalse.instance
  end

  def my_or(_a_boolean)
    self
  end

  def my_and(a_boolean)
    a_boolean
  end
end

class MyFalse < MyBoolean
  include Boolean
  include Singleton
  def not
    MyTrue.instance
  end

  def my_or(a_boolean)
    a_boolean
  end

  def my_and(a_boolean)
    self
  end

  def if_false
    yield
  end

  def if_true
    nil
  end
end
