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
    @team = Team.new(creator_id: creatorId, name: name)
    if @team.save
      render json: @team
    else
      render json: { :errors => @team.errors.full_messages}, status: 401
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    render nothing: true
  end

  def invite_user
    @user = User.find_by(username: params[:username])
    if !@user
      render json: {:errors => ["No user found with that name"]}, status: 401
    else
      @team = Team.find(params[:id])
      if @team.invited_users.include? @user
        render json: {:errors => ["That user is already part of this team"]}, status: 401
      else
        @team.invited_users << @user
        @team.save
        render json: { user: {username: @user.username }}
      end
    end
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
