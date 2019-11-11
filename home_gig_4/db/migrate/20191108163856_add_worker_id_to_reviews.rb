class AddWorkerIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :worker_id, :integer
  end
end
