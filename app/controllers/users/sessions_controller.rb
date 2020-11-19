# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :resource_name

  def resource_name
    :user
  end

  # GET /resource/sign_in
  def new
    render 'users/sessions/new'
  end

  # POST /resource/sign_in
  # def create
  #   client_id = 'c2cdca1030ca96c2cfd0'
  #   client_secret = '51945b7703a1335e9a1d570e86b98b5041ef16d9'
  #   code = params[:code]

  #   conn = Faraday.new(url: 'https://github.com', headers: {'Accept': 'application/json'}) 

  #   response = conn.post('/login/oauth/access_token') do |req|
  #     req.params['code'] = code
  #     req.params['client_id'] = client_id
  #     req.params['client_secret'] = client_secret
  #   end

  #   data = JSON.parse(response.body, symbolize_names: true)
  #   access_token = data[:access_token]
    
  #   # note we're hitting a different domain, api.github.com
  #   # so we're going to rebuild 'conn'
  #   conn = Faraday.new(
  #     url: 'https://api.github.com',
  #     headers: {
  #         'Authorization': "token #{access_token}"
  #     }
  #   )
  #   response = conn.get('/user')
  #   data = JSON.parse(response.body, symbolize_names: true)

  #   # user          = User.find_or_create_by(uid: data[:id])
  #   # user.username = data[:login]
  #   # user.uid      = data[:id]
  #   # user.token    = access_token
  #   # user.save
  #   # session[:user_id] = user_id
    
  #   redirect_to places_path
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
