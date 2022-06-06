require 'rails_helper'

RSpec.describe QuizGuess, type: :model do
  it "is correct if the IDs match up" do
    behavior = Behavior.new(id: 1, competency_id: 34, level_id: 8)
    guess = QuizGuess.new(behavior: behavior, competency_id: 34, level_id: 8)
    expect(guess).to be_correct
  end

  it "is not correct if the level is incorrect" do
    behavior = Behavior.new(id: 1, competency_id: 34, level_id: 8)
    guess = QuizGuess.new(behavior: behavior, competency_id: 34, level_id: 3)
    expect(guess).to_not be_correct
  end

  it "is not correct if the competency is incorrect" do
    behavior = Behavior.new(id: 1, competency_id: 34, level_id: 8)
    guess = QuizGuess.new(behavior: behavior, competency_id: 4, level_id: 8)
    expect(guess).to_not be_correct
  end
end
