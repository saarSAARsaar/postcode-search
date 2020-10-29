require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  test "#results string is nil, returns all places" do
    search = Search.new
    assert Place.all, search.results
  end

  test "#results string is empty, returns all places" do
    search = Search.new
    search.input = ""
    assert Place.all, search.results
  end

  test "#results string is a valid postcode, returns one place" do
    search = Search.new
    search.input = '1000'
    assert places(:lausanne), search.results
  end

  test "#results string is a valid name, returns one place" do
    search = Search.new
    search.input = 'Lausanne'
    assert places(:lausanne), search.results
  end

  test "#results string is a part of multiple names, returns multiple places" do
    search = Search.new
    search.input = 'z'
    assert [places(:zurich), places(:kanzu)], search.results
  end

  test "#results string is an invalid postcode, returns no place" do
    search = Search.new
    search.input = '9999999999'
    assert true, search.results.empty?
  end

  test "#results string is an invalid name, returns no place" do
    search = Search.new
    search.input = '2ify3iu2fu2'
    assert true, search.results.empty?
  end

  test "#results string is a part of multiple names, one canton is given, returns one place" do
    search = Search.new
    search.canton = 'ab'
    search.input = 'l'
    assert places(:lausanne), search.results.empty?
  end
end
