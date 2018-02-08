class AddParentidToAcomments < ActiveRecord::Migration[5.1]
  def change
    add_column :acomments, :parent_id, :integer
  end
end
