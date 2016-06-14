class Team < ActiveRecord::Base

  has_many :lists, dependent: :destroy

  has_many :invited_user_relationships, class_name: "TeamUserRelationship"


  belongs_to :creator, class_name: "User"
  has_many :invited_users, through: :invited_user_relationships

  def as_json(options={})
    super(:only => [:name, :id],
          :include => [{:creator => {:only => :username}},
                       {:invited_users => {:only => [:username]}}]
         )
  end

end
