class Api::ListsController < ApplicationController

  def index
    @lists = List.all.select { |list| list.parent_list.nil? }
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
      @list = List.new(title: params[:title])
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

end
