require 'rails_helper'

RSpec.describe "behaviors/index", type: :view do
  before(:each) do
    pillar = Pillar.create!(name: "a")
    competency = Competency.create!(name: "Competency Name", pillar: pillar)
    level = Level.create!(name: "Level Name")
    assign(:behaviors, [
      Behavior.create!(
        description: "Behavior Description",
        competency: competency,
        level: level
      ),
      Behavior.create!(
        description: "Behavior Description",
        competency: competency,
        level: level
      )
    ])
  end

  it "renders a list of behaviors" do
    render
    assert_select "div#behaviors>div>p", text: /Behavior Description/, count: 2
    assert_select "div#behaviors>div>p", text: /Competency Name/, count: 2
    assert_select "div#behaviors>div>p", text: /Level Name/, count: 2
  end
end
