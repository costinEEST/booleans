require "test_helper"
require "project"

class ProjectTest < ActiveSupport::TestCase
  # test "example" do
  #   assert true, "Example passes, tests are executing correctly"
  # end
  # def test_that_it_has_a_version_number
  #   refute_nil ::Boolean::VERSION
  # end

  def test_false_negated_is_true_and_viceversa
    my_false = MyFalse.instance
    my_true = MyTrue.instance

    assert_equal my_false.not, my_true
    assert_equal my_true.not, my_false
  end

  def test_my_false_or_my_false_is_my_false
    my_false = MyFalse.instance
    assert_equal my_false.my_or(my_false), my_false
  end

  def test_my_false_or_my_true_is_my_true
    my_false = MyFalse.instance
    my_true = MyTrue.instance
    assert_equal my_false.my_or(my_true), my_true
  end
end
