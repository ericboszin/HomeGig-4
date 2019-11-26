class BillingController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!
    def new
        @bid = params[:bid]
    end

    def create
        Stripe.api_key =  "sk_test_cwl4g4GFYZaZ9dtfQ7BLWQyb00x6deRBFY"
        token = params[:stripeToken]

        charge = Stripe::Charge.create({
            amount: 999,
            currency: 'usd',
            description: 'Example charge',
            source: token,
        })

        redirect_to root_path
    end
end
