class ApplicationController < ActionController::Base
  # The path used after sign up.
  def after_sign_up_path_for(resource)
    places_path
  end
end
