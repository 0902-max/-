class CreateUserPastQuestionAttempts < ActiveRecord::Migration[7.0]
  def change
    create_table :user_past_question_attempts do |t|
      t.references :user, foreign_key: true
      t.references :past_question, foreign_key: true
      t.string :selected_option
      t.boolean :is_correct
      t.datetime :answered_at

      t.timestamps
    end
  end
end
