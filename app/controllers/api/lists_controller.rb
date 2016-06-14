class Api::ListsController < ApplicationController

  before_action :validate_user

  def index
    @lists = List.where(team_id: params[:teamId]) { |list| list.parent_list.nil? }
    render json: @lists
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    render json: @list
  end

  def create
    if params[:parentListId] != 0
      @list = List.find(params[:parentListId]).child_lists.create(title: params[:title])
    else
      @list = List.new(title: params[:title], team_id: params[:teamId])
      @list.save
    end
    render json: @list
  end

  def update
    @list = List.find(params[:id])
    @list.update(title: params[:title])
    render json: @list
  end

  def show
    @list = List.find(params[:id])
    render json: @list
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
