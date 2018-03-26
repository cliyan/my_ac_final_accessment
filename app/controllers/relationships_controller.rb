class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    new_follow = Relationship.new
    new_follow.update(follower_id: current_user.id, following_id: @user.id)
  end

  def destroy
    @user = User.find(params[:user_id])
    unfollow = Relationship.find(params[:id])
		unfollow.destroy
  end

end
