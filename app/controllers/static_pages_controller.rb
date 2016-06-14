class StaticPagesController < ApplicationController
  def viewAll
    @users = User.all
    @teams = Team.all
    @lists = List.all
  end

end
