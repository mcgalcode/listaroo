class Api::ListItemsController < ApplicationController

  # To destroy a list item, submit a DELETE HTTP request to the url /api/list_items/:id
  # where :id is the id of the list item to be destroyed

  def destroy
    @listitem = ListItem.find(params[:id])
    @listitem.delete
    render nothing: true
  end


  # To create a new list item, pass in a new HTTP request the following parameters:
  # content: the content of the list item
  # parent_list_id: the id of the list the list_item will belong to

  def create
    @listitem = ListItem.new
    @parentlist = List.find(params[:parent_list_id])
    @parentList.list_items.build(content: params[:content])
  end

  # To update a list item, send a PUT HTTP request to /api/list_items/:id
  # Pass the list item content in the params hash with the content key

  def update
    @listitem = ListItem.find(params[:id])
    @listitem.update(content: params[:content])
  end

end
