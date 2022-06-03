require 'rails_helper'

RSpec.describe "competencies/index", type: :view do
  before(:each) do
    pillar = Pillar.create!(name: "Pillar Name")
    assign(:competencies, [
      Competency.create!(
        name: "Competency Name",
        pillar: pillar
      ),
      Competency.create!(
        name: "Competency Name",
        pillar: pillar
      )
    ])
  end

  it "renders a list of competencies" do
    render
    assert_select "div#competencies>div>p", text: /Competency Name/, count: 2
    assert_select "div#competencies>div>p", text: /Pillar Name/, count: 2
  end
end
