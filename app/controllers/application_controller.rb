class ApplicationController < ActionController::Base
  
  include Pundit
  protect_from_forgery with: :exception
  # after_action :verify_authorized, unless: :devise_controller?
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  
  def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :citizen_id, :role, :institute_id, :email, :password, :remember_me])
	  devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
	  devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :citizen_id, :role, :institute_id])
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
