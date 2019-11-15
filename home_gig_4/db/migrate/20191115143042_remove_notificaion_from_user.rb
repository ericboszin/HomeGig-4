class RemoveNotificaionFromUser < ActiveRecord::Migration[6.0]
  def change
  	remove_column :users, :notificaion
  end
end
