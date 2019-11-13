class UserMailer < ApplicationMailer

default from: 'notifications@homegig.io'
 
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
    mail(to: @bid.email, subject: 'A job you bid for has been started.')
  end

  def job_completed_email
    @user = params[:user]
    @job = params[:job]
    mail(to: @user.email, subject: 'A job you are working on has been completed.')
  end

  def job_cancelled_email
    @user = params[:user]
    @job = params[:job]
    mail(to: @user.email, subject: 'A job you bid for has been cancelled.')
  end

end


end
