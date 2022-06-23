require "test_helper"
require "boolean"

class ProjectTest < ActiveSupport::TestCase
  describe 'not' do
    def test_false_negated_is_true_and_viceversa
      my_false = MyFalse.instance
      my_true = MyTrue.instance
  
      assert_equal my_false.not, my_true
      assert_equal my_true.not, my_false
    end
  end

  describe 'or' do
    def test_false_or_false_is_false
      my_false = MyFalse.instance
      assert_equal my_false.my_or(my_false), my_false
    end
  
    def test_false_or_true_is_true
      my_false = MyFalse.instance
      my_true = MyTrue.instance
      assert_equal my_false.my_or(my_true), my_true
    end
  
    def test_true_or_true_is_true
      my_true = MyTrue.instance
      assert_equal my_true.my_or(my_true), my_true
    end
  
    def test_true_or_false_is_true
      my_true = MyTrue.instance
      my_false = MyFalse.instance
      assert_equal my_true.my_or(my_false), my_true
    end
  end

  describe 'and' do
    def test_false_and_false_is_false
      my_false = MyFalse.instance
      assert_equal my_false.my_and(my_false), my_false
    end
  
    def test_true_and_true_is_true
      my_true = MyTrue.instance
      assert_equal my_true.my_and(my_true), my_true
    end
  
    def test_false_and_true_is_false
      my_true = MyTrue.instance
      my_false = MyFalse.instance
      assert_equal my_false.my_and(my_true), my_false
    end
  
    def test_true_and_false_is_false
      my_true = MyTrue.instance
      my_false = MyFalse.instance
      assert_equal my_true.my_and(my_false), my_false
    end
  end

  describe 'if' do
    def test_false_if_false_evaluates_its_block
      my_false = MyFalse.instance
      expected = "I am expected"
      assert_equal my_false.if_false { expected }, expected
    end
  
    def test_false_if_true_does_not_evaluate_its_block
      my_false = MyFalse.instance
      unexpected = "I am not expected"
      assert_nil(my_false.if_true { unexpected })
    end
  
    def test_true_if_true_evaluates_its_block
      my_true = MyTrue.instance
      expected = "I am expected"
      assert_equal my_true.if_true { expected }, expected
    end
  
    def test_true_if_false_does_not_evaluate_its_block
      my_true = MyTrue.instance
      unexpected = "I am not expected"
      assert_nil(my_true.if_false { unexpected })
    end
  end
end
