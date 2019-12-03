class AddStripeUserIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stripe_user_id, :string
  end
end
