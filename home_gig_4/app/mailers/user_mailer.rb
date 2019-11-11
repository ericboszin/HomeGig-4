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

end
