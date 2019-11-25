class PassthroughController < ApplicationController

  def index
    if user_signed_in?
      case current_user.role
      when 'worker'
        redirect_to :controller => 'home', :action => 'worker'
      when 'owner'
        redirect_to :controller => 'home', :action => 'owner'
      when 'admin'
        redirect_to :controller => 'home', :action => 'admin'
      else
        redirect_to :controller => 'home', :action => 'index'
        # If you want to raise an exception or have a default root for users without roles
      end
    else
      redirect_to :controller => 'home', :action => 'index'
      #redirect_to path
    end
	end

end
