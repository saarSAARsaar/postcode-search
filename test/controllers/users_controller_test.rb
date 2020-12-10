require 'test_helper'
require 'application_system_test_case'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'make a user and sign in' do
    user_params = { user: { email: 'john.doe@gmail.com',
                            username: 'Doe',
                            password: Devise.friendly_token[0, 20] } }
    assert_difference 'User.count', 1 do
      post user_registration_url, params: user_params
    end
    assert :success
  end
end
