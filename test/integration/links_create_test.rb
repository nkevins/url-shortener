require 'test_helper'

class LinksCreateTest < ActionDispatch::IntegrationTest
  
  def setup
    @link = links(:google)
  end
  
  test "test shorten URL" do
    get root_path
    assert_difference 'Link.count', 1 do
      post create_short_path, params: { link: { original:  "www.google.com"} }
    end
    link = assigns(:link)
    assert_equal link.reload.shortened.length, 6
    assert_difference 'link.reload.hit', 1 do
      get resolve_path link.reload.shortened
    end
    assert_redirected_to 'http://www.google.com'
  end
  
  test "test different type of URL" do
    @link.original = 'https://www.google.com'
    @link.save
    get resolve_path @link.shortened
    assert_redirected_to 'https://www.google.com'
    
    @link.original = 'http://www.google.com'
    @link.save
    get resolve_path @link.shortened
    assert_redirected_to 'http://www.google.com'
    
    @link.original = 'www.google.com'
    @link.save
    get resolve_path @link.shortened
    assert_redirected_to 'http://www.google.com'
  end
end
