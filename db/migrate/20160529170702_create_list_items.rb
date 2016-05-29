class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.content :string
      t.list_id :integer

      t.timestamps null: false
    end
  end
end
