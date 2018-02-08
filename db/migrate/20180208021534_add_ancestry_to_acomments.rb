class AddAncestryToAcomments < ActiveRecord::Migration[5.1]
  def change
    add_column :acomments, :ancestry, :string
    add_index :acomments, :ancestry
  end
end
