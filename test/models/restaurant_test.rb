require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test 'validates name and address presence' do
    city = places(:lausanne)
    restaurant = Restaurant.new(name: '', address: '', place_id: city.id)
    restaurant.validate
    assert_includes restaurant.errors.to_a, "Name can't be blank" 
    assert_includes restaurant.errors.to_a, "Address can't be blank"
  end

  test 'validates restaurant search' do
    restaurant = Restaurant.find_by(place_id: places(:lausanne).id)
    assert_equal restaurant.name, 'Test restaurant name' 
  end
end
