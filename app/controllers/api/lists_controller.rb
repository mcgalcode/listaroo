class Api::ListsController < ApplicationController

  def index
    @lists = List.all
    render json: @lists
  end

  def destroy
    @list = List.find(params[:id])
    @list.delete
    render nothing: true
  end
end
