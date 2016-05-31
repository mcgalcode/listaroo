class Api::ListItemsController < ApplicationController
  def destroy
    @listitem = ListItem.find(params[:id])
    @listitem.delete
    render nothing: true
  end
end
