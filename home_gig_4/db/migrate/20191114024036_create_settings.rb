class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
    	t.integer :user_id
    	t.boolean :bid_created, default: false
    	t.boolean :bid_accepted, default: false
    	t.boolean :job_created, default: false
    	t.boolean :job_edited, default: false
    	t.boolean :job_deleted, default: false
    	t.boolean :job_started, default: false
    	t.boolean :job_completed, default: false
    	t.boolean :job_cancelled, default: false
    	t.boolean :review_posted, default: false
    	t.boolean :review_edited, default: false
    	t.boolean :review_received, default: false




    	t.timestamps
    end
  end
end
