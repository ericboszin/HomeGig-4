class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_job

  def index
    @reviews = @job.reviews
  end

  def show
    @review = @job.reviews.find(params[:id])
  end

  def new
    if @job.user_id != current_user
      flash[:warning] = "Error: Can't review your own work"
    else
      @review = @job.reviews.new
    end
  end

  def edit
    @review = @job.reviews.find(params[:id])
  end
    
  def create
    if @job.status == "completed"
      @review = @job.reviews.create(review_params)
      @review.user_id = current_user.id
      @bid = @job.bids.where(user_id = params[:worker_id])
      @bid.update(reviewed: true)
      if @review.save
        @owner = User.find(current_user.id)
        @worker = User.find(@review.worker_id) 

        if @owner.setting.review_posted
          

          UserMailer.with(owner: @owner, job: @job, review: @review, worker: User.find(@review.worker_id)).review_posted_email.deliver_now
        end  
        if @worker.setting.review_received
          UserMailer.with(owner: @owner, job: @job, review: @review, worker: User.find(@review.worker_id)).review_received_email.deliver_now
        end
        redirect_to job_path(@job)
      else
        flash[:warning] = "Error: Could not create review"
        redirect_to job_path(@job)
      end
    else 
      flash[:warning]= "Error: cannot review a job that has not been completed."
    end
  end

  def update
    @review = @job.reviews.find(params[:id])
    if @review.update(review_params)
        @owner = User.find(current_user.id)

        if @owner.setting.review_edited
          UserMailer.with(owner: @owner, job: @job, review: @review, worker: User.find(@review.worker_id)).review_edited_email.deliver_now
        end
      redirect_to job_path(@job)
    else
      flash[:warning] = "Error: Could update review"
      render 'edit'
    end
  end

  def destroy
    @review = @job.reviews.find(params[:id])
    @user = User.find(@review.user_id)
    @bid = @job.bids.where(user_id = params[:worker_id])
    if current_user == @user
      @bid.update(reviewed: false)
      @review.destroy
    else
      flash[:warning]= "Error: user not authorized to delete review"
    end
    redirect_to job_path(@job)
  end

  private
    def review_params
      params.require(:review).permit(:text, :rating, :worker_id)
    end

    def get_job
      @job = Job.find(params[:job_id])
    end
end
