class UpdateColumn < ActiveRecord::Migration[5.1]
  def change
  	add_column :lists,:finished,:boolean, :default => false
  end
end
