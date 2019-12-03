class Add < ActiveRecord::Migration[6.0]
  def change
  	add_column :settings, :bid_updated, :boolean, :default => true
  end
end
