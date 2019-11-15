class AddBidRevertedToSettings < ActiveRecord::Migration[6.0]
  def change
    add_column :settings, :bid_reverted, :boolean, default: true
  end
end
