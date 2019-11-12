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
    already = false
    @job.bids.each do |bid|
      if bid.user_id == current_user
        flash[:warning] = "Error: You've already bid on this job"
        redirect_to job_bid_path(@job, bid)
      end
    end
    if (@job.user_id == current_user || already)
      flash[:warning] = "Error: Can't bid for your job"
    else
      @bid = @job.bids.new
    end
  end

  def create
    @bid = @job.bids.create(bid_params)
    @bid.user_id = current_user.id
    @bid.selected = 0
    already = false
    @job.bids.each do |bid|
      if bid.user_id == current_user
        flash[:warning] = "Error: You've already bid on this job"
        redirect_to job_bid_path(@job, bid)
      end
    end
    if @bid.save && !already
      UserMailer.with(user: User.find(@job.user_id), job: @job, creator: User.find(current_user.id)).bid_created_email.deliver_now
      redirect_to job_path(@job)
    else
      flash[:warning] = "Error: Could not create bid"
      redirect_to job_path(@job)
    end
  end

  def update
    @bid = @job.bids.find(params[:id])

    if @bid.update(bid_params)
      redirect_to job_path(@job)
    else
      render 'edit'
    end
  end

  def destroy
    @bid = @job.bids.find(params[:id])
    @user = User.find(@bid.user_id)
    if @job.status == 'completed'
      flash[:warning] = "Job has already been marked completed"
      redirect_to job_path(@job)
    end
    if current_user == @user
      @bid.destroy
    else
      flash[:warning] = "Error: user not authorized to delete bid"
    end
    redirect_to job_path(@job)
  end

  def reject
    @job = Job.find(params[:job_id])
    @bid = Bid.find(params[:bid_id])
    user = User.find(@job.user_id)
    if @job.status == 'completed'
      flash[:warning] = "Job has already been marked completed"
      redirect_to job_path(@job)
    end
    if current_user == user
      @bid.destroy
    else
      flash[:warning] = "Error: user not authorized to reject bid"
    end
    redirect_to job_bids_path(@job)
  end

  def accept
    @job = Job.find(params[:job_id])
    @bid = @job.bids.find(params[:bid_id])
    user = User.find(@job.user_id)
    if current_user == user
      @bid.selected = 1
      @bid.save
      UserMailer.with(user: User.find(@bid.user_id), job: @job, owner: User.find(current_user.id)).bid_accepted_email.deliver_now

    else
      flash[:warning] = "Error: user not authorized to accept bid"
    end
    redirect_to job_bids_path
  end

  def revert_bid
    @job = Job.find(params[:job_id])
    @bid = @job.bids.find(params[:bid_id])
    user = User.find(@job.user_id)
    if current_user == user
      @bid.selected = 0
      @bid.save
    else
      flash[:warning] = "Error: user not authorized to accept bid"
    end
    redirect_to job_bids_path
  end

  private

  def bid_params
    params.require(:bid).permit(:description, :job_id, :amount, :starting_date, :duration)
  end

  def get_job
    @job = Job.find(params[:job_id])
  end

end
