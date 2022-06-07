require "test_helper"
require "boolean"

class ProjectTest < ActiveSupport::TestCase
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

  def test_my_true_or_my_true_is_my_true
    my_true = MyTrue.instance
    assert_equal my_true.my_or(my_true), my_true
  end

  def test_my_true_or_my_false_is_my_true
    my_true = MyTrue.instance
    my_false = MyFalse.instance
    assert_equal my_true.my_or(my_false), my_true
  end

  def test_my_false_and_my_false_is_my_false
    my_false = MyFalse.instance
    assert_equal my_false.my_and(my_false), my_false
  end

  def test_my_true_and_my_true_is_my_true
    my_true = MyTrue.instance
    assert_equal my_true.my_and(my_true), my_true
  end

  def test_my_false_and_my_true_is_my_false
    my_true = MyTrue.instance
    my_false = MyFalse.instance
    assert_equal my_false.my_and(my_true), my_false
  end

  def test_my_true_and_my_false_is_my_false
    my_true = MyTrue.instance
    my_false = MyFalse.instance
    assert_equal my_true.my_and(my_false), my_false
  end

  def test_my_false_if_false_evaluates_its_block
    my_false = MyFalse.instance
    expected = "I am expected"
    assert_equal my_false.if_false { expected }, expected
  end

  def test_my_false_if_true_does_not_evaluate_its_block
    my_false = MyFalse.instance
    expected = "I am expected"
    assert_nil(my_false.if_true { expected })
  end
end
