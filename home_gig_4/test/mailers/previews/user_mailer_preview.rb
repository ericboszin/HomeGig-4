# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def bid_accepted_email
    	UserMailer.with(owner: User.first, job: Job.first, user: User.last).bid_accepted_email
        
  	end

	def bid_created_email
    	UserMailer.with(user: User.first, job: Job.first, creator: User.last).bid_created_email
        
  	end

	def bid_reverted_email
    	UserMailer.with(user: User.first, job: Job.first, owner: User.last).bid_reverted_email
        
  	end

  	def job_created_email
  		UserMailer.with(user: User.first, job: Job.first).job_created_email
   
  	end  

  	def job_edited_email
  		UserMailer.with(user: User.first, job: Job.first).job_edited_email
    
  	end

  	def job_started_email
  		UserMailer.with(user: User.first, job: Job.first, bidder: User.last).job_started_email
  	end

  	def job_completed_email
  		UserMailer.with(user: User.first, job: Job.first, bidder: User.last).job_completed_email
    	
  	end

  	def job_cancelled_email
  		UserMailer.with(user: User.first, job: Job.first, bidder: User.last).job_cancelled_email

  	end

  	def job_deleted_email
  		UserMailer.with(user: User.first, job: Job.first).job_deleted_email
    
  	end

    def review_posted_email
      UserMailer.with(owner: User.first, job: Job.first, worker: User.last, review: Review.first).review_posted_email
    end

  def review_edited_email
    UserMailer.with(owner: User.first, job: Job.first, worker: User.last, review: Review.first).review_edited_email
  end

    def review_received_email
    UserMailer.with(owner: User.first, job: Job.first, worker: User.last, review: Review.first).review_received_email
  end
end
