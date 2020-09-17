require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase
    test 'display restaurants on place show page' do
        visit root_path
        within 'body > table > tbody > tr:nth-child(2)' do
            click_on 'Show'
        end
        click_on 'Restaurants'

        assert 'body > table > tbody > tr:first > td:first', 'Test restaurant name'
    end
end