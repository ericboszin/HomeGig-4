class AddAcceptedToBids < ActiveRecord::Migration[6.0]
  def change
    add_column :bids, :accepted, :boolean
  end
end
