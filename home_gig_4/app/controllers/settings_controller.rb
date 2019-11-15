class SettingsController < ApplicationController
  before_action :setting_owner
	def index
		@settings = current_user.setting
	end
	def show
		@setting = Setting.find(params[:id])
	end

	def create
	end

	def setting_owner
			    @setting = Setting.find_by(user_id: params[:id])
			if @setting.user_id != current_user.id
      				redirect_to(root_path)
      		end
    end

end
