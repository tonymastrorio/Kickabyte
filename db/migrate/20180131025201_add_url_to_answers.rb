class AddUrlToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :url, :string
  end
end
