class ListsController < ApplicationController

  def index
    @lists = List.all.select { |list| list.parent_list.nil? }
    respond_to do |format|
      format.html
      format.json { render json: @lists }
    end
  end


end
