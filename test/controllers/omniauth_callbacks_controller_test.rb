class OmniauthCallbacksControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
  
    setup do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    end
  
    test 'POST/users/auth/github/callback' do
      post user_github_omniauth_callback_path
      assert :success
    end
  end