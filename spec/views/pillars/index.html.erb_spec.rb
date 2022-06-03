require 'rails_helper'

RSpec.describe "pillars/index", type: :view do
  before(:each) do
    assign(:pillars, [
      Pillar.create!(
        name: "Pillar Item"
      ),
      Pillar.create!(
        name: "Pillar Item"
      )
    ])
  end

  it "renders a list of pillars" do
    render
    assert_select "div#pillars>div>p", text: /Pillar Item/, count: 2
  end
end
