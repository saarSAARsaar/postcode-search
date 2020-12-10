require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  test "places gets shown" do
    user = users(:user1)
    sign_in user
    get places_path
    
    assert_response :success
  end

  test "place gets shown" do
    user = users(:user1)
    sign_in user
    get places_path(places(:lausanne))

    assert_response :success
  end

  test "place edit form gets shown" do
    user = users(:user1)
    sign_in user
    get edit_place_path(places(:lausanne))

    assert_response :success
  end
end
