class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.text :description
      t.float :amount
      t.integer :status
      t.string :starting_date
      t.string :duration
      
      t.timestamps
    end
  end
end
