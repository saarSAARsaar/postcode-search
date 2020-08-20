require "application_system_test_case"

class PlacesTest < ApplicationSystemTestCase
  # test "the truth" do
  #   assert false
  # end
  test "user sees list of places when visiting home page" do
    visit root_path
    assert_selector "body > table > tbody > tr:nth-child(4) > td:nth-child(2)", text:"Zurich"

    fill_in 'search[input]', with: 'Z'
    click_button "Create Search"
    (2..3).each do |n|
        assert_selector "body > table > tbody > tr:nth-child(#{n}) > td:nth-child(2)" do
            assert 'Z', 1
        end
    end

    visit root_path
    select 'AB', from: 'search[canton]'
    click_button "Create Search"
    (2..3).each do |n|
        assert_selector "body > table > tbody > tr:nth-child(2) > td:nth-child(3)" do
            assert 'AB', 1
        end
    end

    visit root_path
    within 'body > table > tbody > tr:nth-child(2)' do
        click_on 'Show'
    end
    click_on 'Edit'
    text_area = first(:css, 'textarea').native
    text_area.send_keys('Test')
    click_button "Update Place"
    assert page.text.match('Description:\nTest').size > 0
    debugger
  end
end
