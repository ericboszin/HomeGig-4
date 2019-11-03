class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.text :description
      t.belongs_to :job, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.float :amount
      t.integer :status
      t.string :starting_date
      t.string :duration
      
      t.timestamps
    end
  end
end
