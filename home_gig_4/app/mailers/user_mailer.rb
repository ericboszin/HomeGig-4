class UserMailer < ApplicationMailer

default from: 'no-reply@homegig.com'
 
  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def bid_created_email
    @user = params[:user]
    @job = params[:job]
    @creator = params[:creator]
    mail(to: @user.email, subject: 'New Bid Submitted to Your Job.')
  end

  def bid_accepted_email
    @user = params[:user]
    @job = params[:job]
    @owner = params[:owner]
    mail(to: @user.email, subject: 'Your bid has been accepted.')
  end

  def bid_reverted_email
    @user = params[:user]
    @job = params[:job]
    @owner = params[:owner]
    mail(to: @user.email, subject: 'Your accepted bid has been reverted.')
  end

  def job_created_email
    @user = params[:user]
    @job = params[:job]
    mail(to: @user.email, subject: 'You have successfully created a job.')
  end  

  def job_edited_email
    @user = params[:user]
    @job = params[:job]
    mail(to: @user.email, subject: 'You have successfully edited your job.')
  end

  def job_started_email
    @user = params[:user]
    @job = params[:job]
    @bidder = params[:bidder]
    mail(to: @bidder.email, subject: 'A job you bid for has been started.')
  end

  def job_completed_email
    @user = params[:user]
    @job = params[:job]
    @bidder = params[:bidder]
    mail(to: @bidder.email, subject: 'A job you are working on has been completed.')
  end

  def job_cancelled_email
    @user = params[:user]
    @job = params[:job]
    mail(to: @bidder.email, subject: 'A job you bid for has been cancelled.')
  end

  def review_posted_email
    @owner = params[:owner]
    @job = params[:job]
    @worker = params[:worker]
    @review = params[:review]
    mail(to: @owner.email, subject: 'You have successfully posted a review.')
  end

  def review_edited_email
    @owner = params[:owner]
    @job = params[:job]
    @worker = params[:worker]
    @review = params[:review]
    mail(to: @owner.email, subject: 'You have successfully edited a review.')
  end

    def review_received_email
    @owner = params[:owner]
    @job = params[:job]
    @worker = params[:worker]
    @review = params[:review]
    mail(to: @worker.email, subject: 'An owner has left you a review.')
  end

end