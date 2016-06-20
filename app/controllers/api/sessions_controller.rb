class Api::SessionsController < ApplicationController

  def create
    username = params[:username]
    password = params[:password]
    if @user = User.find_by(username: username)
      if @user.authenticate(password)
        @user.update(api_token: generate_api_token)
        render json: @user
      else
        render json: {:errors => "Incorrect username/password combination"}, status: 401
      end
    else
      render json: {:errors => "No user found with that name"}, status: 400
    end
  end

  def destroy
    user_id = params[:id]
    User.find(user_id).update(api_token: "")
    render nothing: true
  end

  private
    def generate_api_token
      SecureRandom.hex
    end

end
