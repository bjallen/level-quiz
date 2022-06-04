require 'rails_helper'

RSpec.describe "quiz_guesses/show", type: :view do
  before(:each) do
    pillar = Pillar.create!(name: "a")
    competency = Competency.create!(name: "b", pillar: pillar)
    level = Level.create!(name: "c")
    behavior = Behavior.create!(description: "behavior", competency: competency, level: level)
    @quiz_guess = assign(:quiz_guess, QuizGuess.create!(
      behavior: behavior,
      level: level,
      competency: competency
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
