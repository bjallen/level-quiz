require 'rails_helper'

RSpec.describe "quiz_guesses/new", type: :view do
  before(:each) do
    pillar = Pillar.create!(name: "a")
    competency = Competency.create!(name: "b", pillar: pillar)
    level = Level.create!(name: "c")
    behavior = Behavior.create!(description: "behavior", competency: competency, level: level)
    assign(:pillars, [pillar])
    assign(:levels, [level])
    assign(:behavior, behavior)
    assign(:quiz_guess, QuizGuess.new(
      behavior: nil,
      level: nil,
      competency: nil
    ))
  end

  it "renders new quiz_guess form" do
    render

    assert_select "form[action=?][method=?]", quiz_guesses_path, "post" do

      assert_select "input[name=?]", "quiz_guess[behavior_id]"

      assert_select "input[name=?]", "quiz_guess[level_id]"

      assert_select "input[name=?]", "quiz_guess[competency_id]"
    end
  end
end
