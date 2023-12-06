class VocabularyEntriesController < ApplicationController
    def new
      @vocabulary_note = VocabularyNote.find(params[:vocabulary_note_id])
      @vocabulary_entry = @vocabulary_note.vocabulary_entries.new
    end
  end
  