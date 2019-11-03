class BidsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @bids = Bid.all
  end

  def show
    @bid = Bid.find(params[:id])
  end

  def edit
    @bid = Bid.find(params[:id])
  end

  def new
    @bid = Bid.new
  end

  def create
    status = '0'
    @job = Job.find(params[:job_id])
    @bid = @job.bids.create(bid_params)
    @bid.user_id = current_user.id
    if @bid.save
      redirect_to job_path(@job)
    else
      flash[:warning] = "Error: Could not create Bid"
      redirect_to job_path(@job)
    end
  end

  def update
    @bid = Bid.find(params[:id])

    if @bid.update(bid_params)
      redirect_to @bid
    else
      render 'edit'
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @bid = @job.bids.find(params[:id])
    user = User.find(@bid.user_id)
    if current_user == user
      @bid.destroy
    else
      flash[:warning]= "Error: user not authorized to delete bid"
    end
    redirect_to job_path(@job)
  end

  private
    def bid_params
      params.require(:bid).permit(:description, :job, :amount)
    end
end
