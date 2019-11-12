class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,:notification, :email, :password, :password_confirmation, :first_name, :last_name, :birthday, :aboutme, :skill, :role, :country, :phone)}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :notification, :email, :password, :password_confirmation, :current_password, :first_name, :last_name, :birthday, :aboutme, :skill, :role, :country, :phone)}
        end

        def after_sign_in_path_for(resource)
  			if current_user.role == "owner"
  				return home_owner_path
  			elsif current_user.role == "worker"
  				return home_worker_path
  			else
  				puts current_user.role
  				return root_path
  			end

  		end
end
