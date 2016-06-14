class User < ActiveRecord::Base

  has_many :team_invitations, class_name: "TeamUserRelationship", foreign_key: :invited_user_id

  has_many :invited_to_teams, through: :team_invitations, source: :team
  has_many :created_teams, class_name: "Team", foreign_key: :creator_id


  has_secure_password

  def as_json(options={})
    super(:only => [:id, :first_name, :last_name, :username, :email, :api_token] )
  end
end
