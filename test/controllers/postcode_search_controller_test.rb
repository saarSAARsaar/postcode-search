require 'test_helper'

class PostcodeSearchControllerTest < ActionDispatch::IntegrationTest
  test "a search gets made" do
    sign_in users(:user1)
    post user_session_url
    follow_redirect!
    post postcode_search_index_path, params: {'search' => {'input' => 'ka', 'canton' => 'XY'}}
    
    assert_response :success
  end
end
