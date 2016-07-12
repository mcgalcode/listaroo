class Api::ListsController < ApplicationController

  # before_action :validate_user

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
    # If there is no parent list then assume that we should just assign the list to the current users team
    if params[:parentListId] != 0
      parentList = List.find(params[:parentListId])
      @list = List.new(title: params[:title])
    else
      @list = List.new(title: params[:title], team_id: params[:teamId])
    end
    if @list.save
      if parentList
        parentList.child_lists << @list
      end
      render json: @list
    else
      render json: {:errors => @list.errors.full_messages}, status: 401
    end
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
