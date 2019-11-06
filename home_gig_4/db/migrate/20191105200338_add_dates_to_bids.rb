class AddDatesToBids < ActiveRecord::Migration[6.0]
  def change
    add_column :bids, :starting_date, :string
    add_column :bids, :duration, :integer
  end
end
