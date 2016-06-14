class TeamUserRelationship < ActiveRecord::Base
  belongs_to :team
  belongs_to :invited_user, class_name: "User"
end
