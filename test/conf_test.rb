require 'test_helper'


class GitosisStyleTest < MiniTest::Unit::TestCase
  def setup
     @parser = Parse::Conf::GitosisStyle.new(File.open('test/config_example/gitosis.conf').read)
  end

  def test_instance_of_class
    assert_instance_of Parse::Conf::GitosisStyle, @parser
  end

  def test_return_hash
    assert @parser.result
  end
end
