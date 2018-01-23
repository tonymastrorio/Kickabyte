class AddDataToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :user_id, :integer
    add_column :questions, :body, :string
    remove_column :questions, :category
  end
end
