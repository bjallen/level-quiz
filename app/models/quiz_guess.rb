class QuizGuess < ApplicationRecord
  belongs_to :behavior
  belongs_to :level
  belongs_to :competency
  
  def correct?
    behavior.competency_id == competency_id &&
      behavior.level_id == level_id
  end
end
