require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
<<<<<<< HEAD
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
=======
  # test "the truth" do
  #   assert true
  # end
>>>>>>> 1b818e97dbefb7fc51efc46f6ccb8aa624a2cb90
end
