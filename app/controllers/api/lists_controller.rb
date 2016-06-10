class Api::ListsController < ApplicationController

  def index
    @lists = List.all
    render json: @lists
  end

  def destroy
    @list = List.find(params[:id])
    @list.delete
    render json: @list
  end

  def create
    @list = List.new(title: params[:title])
    @list.save
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
