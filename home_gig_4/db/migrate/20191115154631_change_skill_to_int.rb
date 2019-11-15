class ChangeSkillToInt < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :skill, :integer
  end
end
