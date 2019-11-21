class ChangeDateToBeDateTimeInBids < ActiveRecord::Migration[6.0]
  def change
    change_column :bids, :starting_date, 'timestamp USING CAST(starting_date AS timestamp)'
  end
end
