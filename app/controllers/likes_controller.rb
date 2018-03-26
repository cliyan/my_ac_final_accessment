class LikesController < ApplicationController

  def create
		@like = Like.all
		@note = Note.find(params[:note_id])
		note_likes = @note.likes.build
		note_likes.user = current_user
		note_likes.save
  end
  
  def destroy
		@like = Like.all
		@note = Note.find(params[:note_id])
		like = Like.find(params[:id])
		like.destroy
  end
  
end
