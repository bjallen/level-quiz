require 'rails_helper'

RSpec.describe "pillars/new", type: :view do
  before(:each) do
    assign(:pillar, Pillar.new(
      name: "MyString"
    ))
  end

  it "renders new pillar form" do
    render

    assert_select "form[action=?][method=?]", pillars_path, "post" do

      assert_select "input[name=?]", "pillar[name]"
    end
  end
end
