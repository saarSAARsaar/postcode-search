require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test 'validates name and address presence' do
    city = places(:lausanne)
    restaurant = Restaurant.new(name: '', address: '', place_id: city.id)
    restaurant.validate

    assert restaurant.errors.to_a, "Name can't be blank"
    assert restaurant.errors.to_a, "Address can't be blank"
  end

  test 'validates restaurant search' do
    restaurant = Restaurant.find_by(place_id: places(:lausanne).id)

    assert restaurant.name, 'Test restaurant name'
  end
end
