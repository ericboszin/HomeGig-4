class BidsController < ApplicationController
  before_action :get_job

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
    @bid = @job.bids.new(bid_params)

    if @bid.save
      redirect_to @job
    else
      flash[:warning] = "Error: Could not create Bid"
      render 'new'
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
    @bid.destroy

    redirect_to bids_path
  end

  private
    def bid_params
      params.require(:bid).permit(:description, :job_id, :amount)
    end

    def get_job
      @job = Job.find(params[:job_id])
    end
end
