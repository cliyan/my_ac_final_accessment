class NotesController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @note = Note.new
    @notes = Note.all
    @user = current_user
    @user_note = current_user.notes.order("created_at DESC")
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      flash[:notice] = "Note was saved successfully!"
    else
      flash.now[:alert] = "Note was not saved"
    end
    redirect_to notes_path
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      flash[:notice] = "Note was updated successfully."
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "Failed to update note."
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    flash[:alert] = "Note was deleted."
    redirect_to user_path(current_user)
  end

  private

  def note_params
    params.require(:note).permit(:post)
  end

end
