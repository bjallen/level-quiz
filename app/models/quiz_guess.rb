class QuizGuess < ApplicationRecord
  belongs_to :behavior
  belongs_to :level
  belongs_to :competency
end
