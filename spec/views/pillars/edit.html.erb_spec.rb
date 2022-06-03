require 'rails_helper'

RSpec.describe "pillars/edit", type: :view do
  before(:each) do
    @pillar = assign(:pillar, Pillar.create!(
      name: "MyString"
    ))
  end

  it "renders the edit pillar form" do
    render

    assert_select "form[action=?][method=?]", pillar_path(@pillar), "post" do

      assert_select "input[name=?]", "pillar[name]"
    end
  end
end
