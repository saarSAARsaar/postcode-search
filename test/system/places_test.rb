require "application_system_test_case"

class PlacesTest < ApplicationSystemTestCase

  test "user sees list of places when visiting home page" do
    user = users(:user1)
    sign_in user
    visit root_path 
    assert_selector "#place_#{places(:zurich).id}", text:"Zurich"
  end

  test "search by name" do
    user = users(:user1)
    sign_in user
    visit root_path
    fill_in 'search[input]', with: 'Z'
    click_button "Search"
    assert_selector "#place_#{places(:zurich).id}" 
    assert_selector "#place_#{places(:kanzu).id}" 
    within "tbody" do
      assert_selector "tr", count: 2
    end
  end

  test "search by empty string" do
    user = users(:user1)
    sign_in user
    visit root_path
    fill_in 'search[input]', with: ''
    click_button "Search"
    within "tbody" do
      assert_selector "tr", count: Place.count
    end
  end

  test "filter places based on canton" do
    user = users(:user1)
    sign_in user
    visit root_path
    select 'AB', from: 'search[canton]'
    click_button "Search"
    assert_selector "#place_#{places(:bern).id}" 
    assert_selector "#place_#{places(:lausanne).id}" 
    within "tbody" do
      assert_selector "tr", count: 2
    end
  end

  test "filter places based on canton = all" do
    user = users(:user1)
    sign_in user
    visit root_path
    select 'All', from: 'search[canton]'
    click_button "Search"
    within "tbody" do
      assert_selector "tr", count: Place.count
    end
  end

  test "edit description" do
    user = users(:user1)
    sign_in user
    visit root_path
    within 'table > tbody > tr:nth-child(2)' do
        click_on 'Show'
    end
    click_on 'Edit'
    fill_in("Description", with: "test")
    click_button "Save"
    assert_selector ".description", text: "test"
  end
  
end
