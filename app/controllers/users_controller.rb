class UsersController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.all
    @user = current_user
    @user_following = @user.followings
  end

  def show
    @user = User.find(params[:id])
    @user_note = @user.notes.order("updated_at DESC")
  end

  def followings
    @user  = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end

end

