class RemoveParentIdFromAnswers < ActiveRecord::Migration[5.1]
  def change
    remove_column :answers, :parent_id
  end
end
