class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
  
  def user_not_authorized
    flash[:alert] = "Access Denied."
    redirect_to (request.referrer || root_path)
  end
end
