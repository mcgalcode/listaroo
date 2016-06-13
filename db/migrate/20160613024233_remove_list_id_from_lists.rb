class RemoveListIdFromLists < ActiveRecord::Migration
  def change
    remove_column :lists, :list_id
  end
end
