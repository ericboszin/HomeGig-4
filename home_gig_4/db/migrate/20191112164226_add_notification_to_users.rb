class AddNotificationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :notification, :boolean
  end
end
