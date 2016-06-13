class RenameUserIdToTeamId < ActiveRecord::Migration
  def change
    rename_column :lists, :user_id, :team_id
  end
end
