class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.string :description
      t.float :amount
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
