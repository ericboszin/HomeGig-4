class BidsController < ApplicationController
  before_action :get_job
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @bids = @job.bids
  end

  def show
    @bid = @job.bids.find(params[:id])
  end

  def edit
    @bid = @job.bids.find(params[:id])
  end

  def new
    @bid = @job.bids.new
  end

  def create
    status = '0'
    @bid = @job.bids.create(bid_params)
    @bid.user_id = current_user.id
    if @bid.save
      redirect_to job_path(@job)
    else
      flash[:warning] = "Error: Could not create bid"
      redirect_to job_path(@job)
    end
  end

  def update
    @bid = @job.bids.find(params[:id])

    if @bid.update(bid_params)
      redirect_to @bid
    else
      render 'edit'
    end
  end

  def destroy
    @bid = @job.bids.find(params[:id])
    @user = User.find(@bid.user_id)
    if current_user == @user
      @bid.destroy
    else
      flash[:warning]= "Error: user not authorized to delete bid"
    end
    redirect_to job_path(@job)
  end

  private
    def bid_params
      params.require(:bid).permit(:description, :job_id, :amount)
    end

    def get_job
      @job = Job.find(params[:job_id])
    end
end
