class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.integer :user_id, default: 0

      t.timestamps null: false
    end
  end
end
