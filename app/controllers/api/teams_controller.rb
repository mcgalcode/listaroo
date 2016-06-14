class Api::TeamsController < ApplicationController

  # before_action :validate_user

  def index
    @user = User.find(params[:userId])
    createdTeams = @user.created_teams
    invitedTeams = @user.invited_to_teams
    if params[:type] == "created"
      render json: createdTeams.as_json(:only => [:id, :name])
    elsif params[:type] == "invited"
      render json: invitedTeams.as_json(:only => [:id, :name])
    end
  end

  def show
    team = Team.find(params[:id])
    render json: team
  end

  def create
    creatorId = params[:creatorId]
    name = params[:name]
    @team = Team.create(creator_id: creatorId, name: name)
    render json: @team
  end

  def destroy
  end


  private
    def validate_user
      @userId = request.headers["useridaroo"]
      @userAuthToken = request.headers["autharoo-token"]
      if @userId && @userAuthToken
        if @user = User.find(@userId)
          if @user.api_token == @userAuthToken
            return
          end
        end
      end
      render nothing: true
    end
end
