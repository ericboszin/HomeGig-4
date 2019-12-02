class AddStatusToReports < ActiveRecord::Migration[6.0]
  def change
  	add_column :reports, :status, :string
  end
end
