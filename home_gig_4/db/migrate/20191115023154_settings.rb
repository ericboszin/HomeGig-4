class Settings < ActiveRecord::Migration[6.0]
  def change
  	change_column :settings, :bid_created, :boolean, :default => true
    change_column :settings, :bid_accepted, :boolean,:default => true
    change_column :settings, :job_created, :boolean,:default => true
    change_column :settings, :job_edited,  :boolean,:default => true
    change_column :settings, :job_deleted, :boolean, :default => true
    change_column :settings, :job_started,  :boolean,:default => true
    change_column :settings, :job_completed,:boolean,  :default => true
    change_column :settings, :job_cancelled, :boolean, :default => true
    change_column :settings, :review_posted,:boolean, :default => true
    change_column :settings, :review_edited,  :boolean,:default => true
    change_column :settings, :review_received, :boolean, :default => true

  end
end
