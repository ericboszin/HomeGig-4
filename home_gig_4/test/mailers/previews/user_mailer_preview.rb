# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def bid_created_email
    	UserMailer.with(user: User.first, job: Job.first, creator: User.last).bid_created_email
        
  	end
end
