class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:id])
    follow = Relationship.new
    follow.update(follower_id: current_user.id, following_id: @user.id)
  end

  def destroy
    @user = User.find(params[:id])
    unfollow = Relationship.find(params[:id])
		unfollow.destroy
  end

end
