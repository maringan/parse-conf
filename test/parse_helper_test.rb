require 'test_helper'

class ParserHelperTest < MiniTest::Unit::TestCase
  def setup
    @text = " [group gitosis]\n "
    @parser_helper = Parse::Conf::ParserHelper
  end

  def test_trim!
    obj = @parser_helper.new(@text)
    obj.trim!

    assert_equal "[group gitosis]", obj.string
  end

  def test_remove_ugly_symbol!
    obj = @parser_helper.new(@text)
    obj.remove_ugly_symbol!

    assert_equal " group gitosis\n ", obj.string
  end

  def test_trim_and_remove_ugly_symbol!
    assert_equal 'group gitosis', @parser_helper.trim_and_remove_ugly_symbol(@text)
  end
end
