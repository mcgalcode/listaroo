class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :content, null: false
      t.integer :list_id, null: false

      t.timestamps null: false
    end
  end
end
