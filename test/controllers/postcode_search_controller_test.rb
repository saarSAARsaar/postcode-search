require 'test_helper'

class PostcodeSearchControllerTest < ActionDispatch::IntegrationTest
  test "places gets shown" do
    get new_postcode_search_path
    assert_response :success 
  end

  test "a search gets made" do
    post postcode_search_index_path, params: {'search' => {'input' => 'ka', 'canton' => 'XY'}}
    assert_response :success
  end
end
