class UserPastQuestionAttempt < ApplicationRecord
    belongs_to :user
    belongs_to :past_question
  end