class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.title :string
      t.user_id :integer

      t.timestamps null: false
    end
  end
end
