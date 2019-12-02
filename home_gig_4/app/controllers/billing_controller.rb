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
      if current_user.role == "owner"
        @job = Job.find(params[:jobId])
        @user = User.find(@job.user_id)
        Stripe.api_key =  "sk_test_cwl4g4GFYZaZ9dtfQ7BLWQyb00x6deRBFY"
        token = params[:stripeToken]
        if @job.status == "cancelled" || @job.status == "completed"
          flash[:warning] = "Error: Cannot accept bids on a completed or cancelled job"
          redirect_to job_path(@job)
        else
          if current_user == @user
            selected_bids = false
            @job.bids.each do |_bid|
              if (_bid.selected == 1) #Bid was selected
                selected_bids = true

                charge = Stripe::Charge.create({
                  amount: (_bid.amount.to_i)*100,
                  currency: 'usd',
                  description: 'Example charge',
                  source: token,
                })

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
end
