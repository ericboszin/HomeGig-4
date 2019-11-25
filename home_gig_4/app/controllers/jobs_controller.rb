class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    redirect_to root_path
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = current_user.jobs.build
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    if current_user.role == "owner"
      @job = current_user.jobs.build(job_params)
      @job.status = "available"

      if @job.save
        if current_user.setting.job_created
          UserMailer.with(user: User.find(@job.user_id), job: @job).job_created_email.deliver_now
        end
        redirect_to root_path
      else
        flash[:warning] = "Error: Could not create job"
        render 'new'
      end
    else
      flash[:warning] = "Error: workers cannot create jobs"
      redirect_to root_path
    end
  end

  def update
    if current_user.role == "owner"
      @job = Job.find(params[:id])
      if @job.status == "completed" || @job.status == "cancelled"
        flash[:warning] = "Error: Cannot update a job that has been cancelled or completed"
        redirect_to @job
      elsif @job.update(job_params)
        if current_user.setting.job_edited
          UserMailer.with(user: User.find(@job.user_id), job: @job).job_edited_email.deliver_now
        end
        redirect_to @job
      else
        render 'edit'
      end
    else
      flash[:warning] = "Error: workers cannot update jobs"
      redirect_to root_path
    end
  end

  def destroy
    if current_user.role == "owner"
      @job = Job.find(params[:id])
      @user = User.find(@job.user_id)
      if current_user == @user

        if current_user.setting.job_deleted
          UserMailer.with(user: User.find(@job.user_id), job: @job).job_deleted_email.deliver_now
        end
        @job.status = "cancelled"
        @job.destroy
      else
        flash[:warning] = "Error: user not authorized to delete job"
      end
      redirect_to root_path
    else
      flash[:warning] = "Error: workers cannot update jobs"
      redirect_to root_path
    end
  end

  def accept_bids
    if current_user.role == "owner"
      @job = Job.find(params[:job_id])
      @user = User.find(@job.user_id)
      if @job.status == "cancelled" || @job.status == "completed"
        flash[:warning] = "Error: Cannot accept bids on a completed or cancelled job"
        redirect_to job_path(@job)
      else
        if current_user == @user
          selected_bids = false
          @job.bids.each do |_bid|
            if (_bid.selected == 1) #Bid was selected
              selected_bids = true
              @bidder = User.find(_bid.user_id)
              if @bidder.setting.job_started
                UserMailer.with(user: User.find(@job.user_id), job: @job, bidder: @bidder).job_started_email.deliver_now
              end
            end
          end
          if selected_bids == false
            flash[:warning] = "Error: You have not accepted a bid"
            redirect_to job_path(@job)
          else
            @job.status = "started"
          end
          @job.save
        else
          flash[:warning] = "Error: user not authorized to accept bid"
        end
        redirect_to job_path(@job)
      end
    else
      flash[:warning] = "Error: workers cannot accept bids"
      redirect_to job_path(@job)
    end
  end

  def complete_job
    if current_user.role == "owner"
      @job = Job.find(params[:job_id])
      @user = User.find(@job.user_id)
      if current_user == @user
        @job.status = 'completed'
        @job.bids.each do |_bid|
          if (_bid.selected == 1) #Bid was selected
            @bidder = User.find(_bid.user_id)
            if @bidder.setting.job_completed
              UserMailer.with(user: User.find(@job.user_id), job: @job, bidder: @bidder).job_completed_email.deliver_now
            end
          else
            _bid.destroy
          end
        end
        @job.save
      else
        flash[:warning] = "Error: user not authorized to accept bid"
      end
      redirect_to root_path
    else
      flash[:warning] = "Error: workers cannot complete jobs"
      redirect_to root_path
    end
  end

  def cancel_job
    if current_user.role == "owner"
      @job = Job.find(params[:job_id])
      @user = User.find(@job.user_id)
      if current_user == @user
        @job.status = 'cancelled'
        @job.bids.each do |_bid|
          if (_bid.selected == 1) #Bid was selected
            @bidder = User.find(_bid.user_id)
            if @bidder.notification
              UserMailer.with(user: User.find(@job.user_id), job: @job, bidder: @bidder).job_cancelled_email.deliver_now
            end
          else
            _bid.destroy
          end
        end
        @job.save
      else
        flash[:warning] = "Error: user not authorized to accept bid"
      end
      redirect_to root_path
    else
      flash[:warning] = "Error: workers cannot cancel jobs"
      redirect_to root_path
    end
  end

  def cost
    @job = Job.find(params[:job_id])
    costs = 0
    @job.bids.each do |_bid|
      if (_bid.selected == 1)
        costs += _bid.amount
      end
    end
    puts costs
    head :ok
  end

  def explore
    @jobs = Job.where(status: "available").or(Job.where(status: "started"))
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :price, :status)
  end
end
