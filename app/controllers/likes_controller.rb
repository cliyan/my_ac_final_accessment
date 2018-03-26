class LikesController < ApplicationController

  def create
		@like = Like.all
		@note = Note.find(params[:note_id])
		note_likes = @note.likes.build
		note_likes.user = current_user
		if note_likes.save
			UserMailer.new_like_email(current_user).deliver_later
		end
  end
  
  def destroy
		@like = Like.all
		@note = Note.find(params[:note_id])
		like = Like.find(params[:id])
		like.destroy
  end
  
end
