class NotesController < ApplicationController
  before_action :authenticate_user!

  def create
    note = Note.new(note_params)
    note.creator = current_user

    if note.save
      notice = 'Note was successfully created'
    else
      alert = note.errors.full_messages
    end
    redirect_to :back, alert: alert, notice: notice
  end

  private
    def note_params
      params.require(:note).permit(:public, :text, :created_by_id, :user_id)
    end
end
