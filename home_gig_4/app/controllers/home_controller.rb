class HomeController < ApplicationController
  def index
  end

  def owner
    @jobs = Job.where(user_id: current_user.id)
  end

  def worker
    @bids = Bid.where(user_id: current_user.id)
  end

  def admin
    @reports = Report.all
  end

end
