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

	def edit
		@setting = Setting.find_by(user_id: params[:id])

  	end
  	def update
  		@setting = Setting.find_by(params[:id])
  		if @setting.update(setting_params)
      				redirect_to(root_path)
	end
    end
	def setting_owner
			    @setting = Setting.find_by(user_id: params[:id])
			if @setting.user_id != current_user.id
      				redirect_to(root_path)
      		end
    end

  def setting_params
    params.require(:setting).permit(:bid_accepted, :bid_created, :job_cancelled, :job_completed, :job_created, :job_deleted, :job_edited, :job_started, :review_edited, :review_psoted, :review_received)
  end


end
