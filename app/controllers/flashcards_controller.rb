class FlashcardsController < ApplicationController
  def index
    @vocabulary_notes = VocabularyNote.all
    @new_entry = VocabularyEntry.new
  end

  def new_entry
    @vocabulary_note = VocabularyNote.find(params[:vocabulary_note_id])
    @entry = VocabularyEntry.new
  end

  def create_entry
    @vocabulary_note = VocabularyNote.find(params[:vocabulary_note_id])
    @entry = @vocabulary_note.vocabulary_entries.build(entry_params)

    if @entry.save
      redirect_to flashcards_path, notice: 'New entry created successfully.'
    else
      render :new_entry
    end
  end

  private

  def entry_params
    params.require(:vocabulary_entry).permit(:word, :meaning)
  end
end
