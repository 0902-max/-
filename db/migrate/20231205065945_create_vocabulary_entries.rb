class CreateVocabularyEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :vocabulary_entries do |t|
      t.references :user, foreign_key: true
      t.references :vocabulary_note, foreign_key: true
      t.string :word
      t.string :meaning

      t.timestamps
    end
  end
end

