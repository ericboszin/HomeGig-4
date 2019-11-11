class AddSelectedToBids < ActiveRecord::Migration[6.0]
  def change
    add_column :bids, :selected, :integer
  end
end
