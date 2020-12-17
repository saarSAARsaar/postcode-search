require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test 'user can sign in' do
    visit new_user_session_path

    fill_in 'Email', with: 'abcdef@gmail.com'
    fill_in 'Password', with: '56kogakhdgTR'

    click_on 'Log in'
    assert_selector '.notice', text: 'Signed in successfully.'
  end

  test 'user can sign up' do
    visit new_user_registration_path

    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '123456', id: 'user_password'
    fill_in 'Password confirmation', with: '123456'
    
    click_on 'Sign up'
    assert_selector '.notice', text: 'Welcome! You have signed up successfully.'
  end

  test 'user can sign out' do
    user = users(:user1)
    sign_in user
    visit root_path

    click_on 'Sign out'
    assert_selector 'h2', text: 'Log in'
  end
end
