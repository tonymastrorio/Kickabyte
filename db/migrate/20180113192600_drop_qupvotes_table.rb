class DropQupvotesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :qupvotes
  end
end
