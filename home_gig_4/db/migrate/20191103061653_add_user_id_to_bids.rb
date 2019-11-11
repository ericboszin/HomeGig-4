class AddUserIdToBids < ActiveRecord::Migration[6.0]
  def change
  	add_column :bids, :user_id, :integer
  end
end
