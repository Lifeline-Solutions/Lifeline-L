class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  before_action :update_allowed_parameters, if: :devise_controller?

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :role, :email, :password, :photo_id, :id_number, :phone_number)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :role, :email, :password, :current_password, :photo_id, :id_number,
               :phone_number)
    end

    # create a new profile for the user after creating user

    def after_sign_up_path_for(resource)
      return unless current_user.profile.nil?

      Profile.create(user_id: current_user.id)
      build_resource({})
      resources.build_profile
      respond_with resource
    end
  end
end
