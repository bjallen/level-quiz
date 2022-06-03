require 'rails_helper'

RSpec.describe "levels/index", type: :view do
  before(:each) do
    assign(:levels, [
      Level.create!(
        name: "Level Name"
      ),
      Level.create!(
        name: "Level Name"
      )
    ])
  end

  it "renders a list of levels" do
    render
    assert_select "div#levels>div>p", text: /Level Name/, count: 2
  end
end
