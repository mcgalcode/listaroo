class User < ActiveRecord::Base
  has_and_belongs_to_many :teams
  has_secure_password

  def as_json(options={})
    super(:only => [:id, :first_name, :last_name, :username, :email, :api_token]
    )
  end
end
