require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  
  test "should get root" do
    get root_url
    assert_response :success
    assert_match 'Shorten URL', response.body 
  end
end
