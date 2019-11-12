class AddReviewedColumnToBids < ActiveRecord::Migration[6.0]
  def change
    add_column :bids, :reviewed, :boolean
  end
end
