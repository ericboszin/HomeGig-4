class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.float :price
      t.text :status

      t.timestamps
    end
  end
end
