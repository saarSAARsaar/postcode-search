require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase
  test 'display restaurants on place show page' do
    user = users(:user1)
    sign_in user
    visit root_path

    within 'table > tbody > tr:nth-child(3)' do
      assert_selector 'td', text: 'Lausanne'
      click_on 'Show'
    end

    click_on 'Restaurants'

    within all('table > tbody > tr').first do 
      assert_selector 'td', text: 'Test restaurant name'
    end
  end

  test 'newly created restaurant gets shown in the list' do
    user = users(:user1)
    sign_in user
    visit root_path
    within 'table > tbody > tr:nth-child(3)' do 
      assert_selector 'td', text: 'Lausanne'
      click_on 'Show'
    end
    click_on 'Restaurants'
    click_on 'Create Restaurant'

    fill_in("Name", with: "test name")
    fill_in("Address", with: "test address")

    click_on 'Save'
    assert_selector '.notice', text: 'Restaurant has been created'
    within all('table > tbody > tr').last do
      assert_selector 'td', text: 'test name'
    end
  end
end 
