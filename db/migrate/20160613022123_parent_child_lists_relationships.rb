class ParentChildListsRelationships < ActiveRecord::Migration
  def change
    create_table :list_relationships do |t|
      t.integer :parent_list_id
      t.integer :child_list_id
    end
  end
end
