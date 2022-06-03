require 'rails_helper'

RSpec.describe "behaviors/new", type: :view do
  before(:each) do
    pillar = Pillar.create!(name: "a")
    competency = Competency.create!(name: "b", pillar: pillar)
    level = Level.create!(name: "c")
    assign(:competencies, [competency])
    assign(:levels, [level])
    assign(:behavior, Behavior.new(
      description: "MyString",
      competency: competency,
      level: level
    ))
  end

  it "renders new behavior form" do
    render

    assert_select "form[action=?][method=?]", behaviors_path, "post" do

      assert_select "input[name=?]", "behavior[description]"

      assert_select "select[name=?]", "behavior[competency_id]"

      assert_select "select[name=?]", "behavior[level_id]"
    end
  end
end
