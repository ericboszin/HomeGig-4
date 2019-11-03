class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end
    
  def create
    @job = Job.find(params[:job_id])
    @review = @job.reviews.create(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to job_path(@job)
    else
      flash[:warning] = "Error: Could not create review"
      redirect_to job_path(@job)
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
        redirect_to @review
    else
        render 'edit'
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @review = @job.reviews.find(params[:id])
    user = User.find(@review.user_id)
    if current_user == user
      @review.destroy
    else
      flash[:warning]= "Error: user not authorized to delete review"
    end
    redirect_to job_path(@job)
  end

  private
    def review_params
      params.require(:review).permit(:text, :rating)
    end
end
