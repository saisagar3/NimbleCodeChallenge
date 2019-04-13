class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  
  def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :citizen_id, :role, :institute_id, :email, :password, :remember_me])
	  devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
	  devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :citizen_id, :role, :institute_id])
  end

  def user_not_authorized
    flash[:alert] = "Access Denied."
    redirect_to (request.referrer || root_path)
  end
end
