class CreateQcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :qcomments do |t|
        t.string :body
        t.integer :question_id
        t.integer :user_id
      t.timestamps
    end
  end
end
