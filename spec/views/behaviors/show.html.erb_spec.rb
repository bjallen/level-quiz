require 'rails_helper'

RSpec.describe "behaviors/show", type: :view do
  before(:each) do
    pillar = Pillar.create!(name: "a")
    competency = Competency.create!(name: "b", pillar: pillar)
    level = Level.create!(name: "c")
    @behavior = assign(:behavior, Behavior.create!(
      description: "Description",
      competency: competency,
      level: level
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
