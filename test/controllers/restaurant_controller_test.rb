require 'test_helper'

class RestaurantControllerTest < ActionDispatch::IntegrationTest
  test 'the restaurant list gets shown' do
    get place_restaurants_path(places(:lausanne))
    assert_response :success
  end

  test 'check if restaurant/new gets shown' do
    get new_place_restaurant_path(places(:lausanne))
    assert_response :success
  end

  test 'a restaurant gets created' do
    lausanne = places(:lausanne)
    restaurant_params = { restaurant: { name: 'test creation',
                                        address: 'test creation',
                                        place_id: lausanne.id } }
    post place_restaurants_path(lausanne), params: restaurant_params
    assert_redirected_to place_restaurants_path
  end

  test 'check if restaurant/edit gets shown' do
    lausanne = places(:lausanne)
    restaurant_1 = lausanne.restaurants.first
    get edit_place_restaurant_path(lausanne, restaurant_1)
    assert_response :success
  end

  test 'a restaurant gets updated' do
    lausanne = places(:lausanne)
    restaurant_1 = lausanne.restaurants.first
    patch place_restaurant_path(lausanne, restaurant_1), params: { restaurant: { name: 'new name', address: 'new address' } }
    assert_redirected_to place_restaurants_path 
  end
end
