require 'rails_helper'

RSpec.describe "competencies/show", type: :view do
  before(:each) do
    pillar = Pillar.create!(name: "a")
    @competency = assign(:competency, Competency.create!(
      name: "Name",
      pillar: pillar
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
