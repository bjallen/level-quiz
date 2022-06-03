require 'rails_helper'

RSpec.describe "competencies/new", type: :view do
  before(:each) do
    pillar = Pillar.create!(name: "a")
    assign(:pillars, [pillar])
    assign(:competency, Competency.new(
      name: "MyString",
      pillar: pillar
    ))
  end

  it "renders new competency form" do
    render

    assert_select "form[action=?][method=?]", competencies_path, "post" do

      assert_select "input[name=?]", "competency[name]"

      assert_select "select[name=?]", "competency[pillar_id]"
    end
  end
end
