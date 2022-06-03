require 'rails_helper'

RSpec.describe "competencies/edit", type: :view do
  before(:each) do
    pillar = Pillar.create!(name: "a")
    assign(:pillars, [pillar])
    @competency = assign(:competency, Competency.create!(
      name: "MyString",
      pillar: pillar
    ))
  end

  it "renders the edit competency form" do
    render

    assert_select "form[action=?][method=?]", competency_path(@competency), "post" do

      assert_select "input[name=?]", "competency[name]"

      assert_select "select[name=?]", "competency[pillar_id]"
    end
  end
end
