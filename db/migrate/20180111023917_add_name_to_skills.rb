class AddNameToSkills < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :name, :string
  end
end
