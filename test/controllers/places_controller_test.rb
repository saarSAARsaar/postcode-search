require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  test "places gets shown" do
    get places_path
    assert_response :success 
  end
  
  test "place gets shown" do
    get places_path(places(:lausanne))
    assert_response :success
  end

  test "place edit form gets shown" do
    get edit_place_path(places(:lausanne))
    assert_response :success
  end
end
