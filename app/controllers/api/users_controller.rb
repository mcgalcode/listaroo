class Api::UsersController < ApplicationController

  def create
    password = params[:password]
    password_confirm = params[:password_confirmation]
    username = params[:username]

    @user = User.new(password: password, password_confirmation: password_confirm, username: username)

    if @user.save
      @user.update(api_token: generate_api_token)
      render json: @user
    else
      render nothing: true
    end
  end


  private
    def generate_api_token
      SecureRandom.hex
    end


end