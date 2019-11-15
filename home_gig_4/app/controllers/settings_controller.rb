class SettingsController < ApplicationController
	def index
		@settings = current_user.setting
	end
	def show
		@setting = Setting.find(params[:id])
	end

	def create
	end
end
