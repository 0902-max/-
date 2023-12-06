class User < ApplicationRecord
  has_many :documents
  has_one :vocabulary_note
  has_many :vocabulary_entries
  has_many :user_past_question_attempts
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
