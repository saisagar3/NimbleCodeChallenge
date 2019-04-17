# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

# GET /resource/sign_up
 def new
   super
 end

#  POST /resource
  def create
    role = params[:user][:role]
   
    if role.blank?
      flash[:error] = "Invalid role specified."
      redirect_to "/users/sign_up"
      return
    end
    role = User.roles.find(role)

    institute_id = params[:user][:institute_id]

    super

#    if role == 'Instructor'
#           super
#    end
#
#    if role == 'Student'
#           super
#    end
#
#    if role == 'Other'
#           super
#    end
  end
  def edit
     super
   end

  # PUT /resource
   def update
     super
   end

  # DELETE /resource
  def destroy
    super
  end

 # GET /resource/cancel
 # Forces the session data which is usually expired after sign
 # in to be expired now. This is useful if the user wants to
 # cancel oauth signing in/up in the middle of the process,
 # removing all OAuth session data.
  def cancel
    super
  end

  protected

 # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :citizen_id, :role, :institute_id, :email, :password, :remember_me])
  end

 # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :citizen_id, :role, :institute_id])
  end

 # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

 # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

end
