require 'test_helper'


class GitosisStyleTest < MiniTest::Unit::TestCase
  def setup
    @expected_result = {"without_group"=>[], "gitosis"=>[{"gitweb"=>["no"]}, {"daemon"=>["no"]}, {"loglevel"=>["DEBUG"]}], "group quux"=>[{"members"=>["jdoe", "wsmith", "@anothergroup"]}, {"writable"=>["foo", "bar", "baz/thud"]}, {"readonly"=>["xyzzy"]}], "group anothergroup"=>[{"members"=>["alice", "bill"]}, {"map writable visiblename1"=>["actualname1"]}, {"map readonly visiblename2"=>["actualname2"]}], "repo foo"=>[{"gitweb"=>["yes"]}, {"description"=>["blah", "blah"]}, {"owner"=>["John", "Doe"]}, {"daemon"=>["yes"]}], "gitweb"=>[], "mirror github"=>[{"repos"=>["@all"]}, {"uri"=>["git@github.com:res0nat0r/%s.git"]}], "repo bar"=>[{"mirrors"=>["/var/trac/bar/repository"]}]}
    
    @config_raw = File.open('test/config_example/gitosis.conf').read
    @parser = Parse::Conf::GitosisStyle.new(@config_raw)
  end

  def test_instance_of_class
    assert_instance_of Parse::Conf::GitosisStyle, @parser
  end

  def test_return_hash
    assert_kind_of Hash, @parser.result
  end

  def test_result
    assert_equal @expected_result, @parser.result
  end

  def test_run
    assert_equal @expected_result, Parse::Conf::GitosisStyle.run(@config_raw)
  end
end
