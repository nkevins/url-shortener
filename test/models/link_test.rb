require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  
  def setup
    @link = Link.new(original: 'www.google.com', shortened: Link.new_shortened_url)
  end
  
  test "should be valid" do
    assert @link.valid?
  end
  
  test "original url is mandatory" do
    @link.original = "  "
    assert_not @link.valid?
  end
  
  test "shortened url must be unique" do
    dupe = @link.dup
    @link.save
    assert_not dupe.valid?
  end
  
  test "shortened url is mandatory" do
    @link.shortened = "  "
    assert_not @link.valid?
  end
end
