class BillingController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!

    def new
        job_id = params[:jobId]
        bid_id = params[:bidId]
        @job = Job.find(job_id)
        @bid = @job.bids.find(bid_id)
    end

    def create
        Stripe.api_key =  "sk_test_cwl4g4GFYZaZ9dtfQ7BLWQyb00x6deRBFY"
        token  = params[:stripeToken]
        job_id = params[:jobId]
        bid_id = params[:bidId]
        @job = Job.find(job_id)
        @bid = @job.bids.find(bid_id)

        charge = Stripe::Charge.create({
            amount: (@bid.amount.to_i)*100,
            currency: 'usd',
            description: 'Example charge',
            source: token,
        })

        @user = User.find(@job.user_id)
        if @job.status == "cancelled" || @job.status == "completed"
          flash[:warning] = "Job has already been marked completed or it has been cancelled"
          redirect_to job_path(@job)
        end
        if current_user == @user
          @bid.selected = 1
          @bid.save
          if User.find(@bid.user_id).setting.bid_created
            UserMailer.with(user: User.find(@bid.user_id), job: @job, owner: User.find(current_user.id)).bid_accepted_email.deliver_now
          end
        else
          flash[:warning] = "Error: user not authorized to accept bid"
        end
        redirect_to job_bids_path(job_id)
    end
end
