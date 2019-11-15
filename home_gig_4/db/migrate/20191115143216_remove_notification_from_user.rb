class RemoveNotificationFromUser < ActiveRecord::Migration[6.0]
  def change
  	  	remove_column :users, :notification

  end
end
