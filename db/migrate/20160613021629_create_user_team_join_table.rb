class CreateUserTeamJoinTable < ActiveRecord::Migration
  def change
    create_table :team_user_relationships, id: false do |t|
      t.integer :team_id
      t.integer :invited_user_id
    end
  end
end
