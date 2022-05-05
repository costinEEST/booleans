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
end

class MyFalse < MyBoolean
  include Boolean
  include Singleton
  def not
    MyTrue.instance
  end
end
