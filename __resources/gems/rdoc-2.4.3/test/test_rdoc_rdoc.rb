require 'rubygems'
require 'minitest/unit'
require 'rdoc/rdoc'

class TestRDocRDoc < MiniTest::Unit::TestCase
  def setup
    @rdoc = RDoc::RDoc.new
  end
  
  def test_parse_uses_options
    options = RDoc::Options.new
    options.parse ["directory"]
    @rdoc.options = options
    
    begin
      @rdoc.parse_files
    rescue Exception => e
      flunk "Parse Files should not throw an exception"
    end
  end
  
  def test_parse_throws_when_options_are_nil
    assert_raises(NoMethodError) {@rdoc.parse_files}
  end
end

MiniTest::Unit.autorun