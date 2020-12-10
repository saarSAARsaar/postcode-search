ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in(resource)
    if resource.provider.nil?
      post user_registration_url, params: { email: resource.email, password: resource.password }
    else
      get '/auth/'.concat(resource.provider)
    end
  end
end
