class CreateAcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :acomments do |t|
        t.string :body
        t.integer :answer_id
        t.integer :user_id
      t.timestamps
    end
  end
end
