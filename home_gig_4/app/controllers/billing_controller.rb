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
            amount: (@bid.amount.to_i),
            currency: 'usd',
            description: 'Example charge',
            source: token,
        })
    end
    
end
