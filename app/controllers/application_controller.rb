class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:avatar, :avatar_cache, :remove_avatar, :remote_avatar_url, :bio])
	    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :avatar, :avatar_cache, :remove_avatar, :remote_avatar_url, :bio])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar, :avatar_cache, :remove_avatar, :remote_avatar_url, :bio])
	  end

end
