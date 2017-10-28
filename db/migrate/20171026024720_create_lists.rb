class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|

      t.string "list_name"
      t.date "due_date", null:false
      t.string "description"
      t.timestamps
    end
  end
end
