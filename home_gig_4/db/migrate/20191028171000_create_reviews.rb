class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :text
      t.integer :rating
      t.belongs_to :job, foreign_key: true
      # t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
