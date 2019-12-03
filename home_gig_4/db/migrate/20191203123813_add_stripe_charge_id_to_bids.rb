class AddStripeChargeIdToBids < ActiveRecord::Migration[6.0]
  def change
    add_column :bids, :stripe_charge_id, :string
  end
end
